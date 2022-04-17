require 'bundler'
require 'sidekiq'
require 'sidekiq/web'
require 'securerandom'
require './app'

Bundler.require

File.open(".session.key", "w") {|f| f.write(SecureRandom.hex(32)) }
use Rack::Session::Cookie, secret: File.read(".session.key"), same_site: true, max_age: 86400

run Rack::URLMap.new('/' => App, '/sidekiq' => Sidekiq::Web)
