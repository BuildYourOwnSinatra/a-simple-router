require_relative 'lib/a-simple-router'
router = ASimpleRouter.new do
  get '/cats' do
    [200, {}, ["Cats!"]]
  end
end

run router
