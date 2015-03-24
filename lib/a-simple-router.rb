class ASimpleRouter
  class Route
    attr_accessor :matcher, :handler

    # Set attributes by key and value
    def initialize(attrs)
      attrs.each {|k,v| send("#{k}=",v)}
      @handler = Proc.new if block_given?
    end

    def call(env)
      handler.call(env)
    end
  end

  attr_accessor :routes

  def initialize(&block)
    @routes = []
    instance_eval(&block) if block_given?
  end

  [:delete, :get, :head, :options, :patch, :post, :put, :trace].each do |verb|
    define_method verb do |path, &block|
      routes << Route.new(matcher: path, handler: Proc.new(&block))
    end
  end

  def find_route(env)
    path = env['PATH_INFO']
    route = routes.detect do |route|
      case route.matcher
      when String
        path == route.matcher
      when Regexp
        path =~ route.matcher
      end
    end
  end

  def call(env)
    route = find_route(env)

    if route
      route.call(env)
    else
      [404, {}, ["Route Not Found"]]
    end
  end
end
