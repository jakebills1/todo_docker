require 'redis'

class HelloController < ApplicationController
  def index
    @redis = Redis.new host: 'redis', port: 6379
  end
end
