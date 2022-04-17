require 'sidekiq'
require './import'

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

$redis = Redis.new( url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" )

class ImportWorker
  include Sidekiq::Worker

  def perform(path)
    Import.new(path).create
  end
end
