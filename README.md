# A Simple Router

A very simple example ruby router you should never actually use. Just for learning purposes. Built for the book [BuildYourOwnSinatra](https://buildYourOwnSinatra.com)

## Installation

Add to your Gemfile:

```ruby
gem 'a-simple-route', github: 'BuildYourOwnSinatra/a-simple-router'
```

## Usage

Place the following in a rackup file

```ruby
require 'a-simple-router'
run ASimpleRouter.new do
  get '/cats', {200, {}, ["Cats!"]}
end
```
