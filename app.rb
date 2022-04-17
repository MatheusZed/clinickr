require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/test'
require './models/doctor'
require './models/patient'
require './models/exam'
require_relative './import'
require './lib/import_worker'
require 'pry'

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

$redis = Redis.new( url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" )
class App < Sinatra::Application
  before do
    content_type 'application/json'
  end

  get '/tests/:result_token' do |token|
    result = Exam.where(result_token: token)
    json = JSON.parse(
      result.to_json(
        methods: %i[patient_response],
        only: %i[result_token result_date],
        include:
        {
          doctor:
          {
            only: %i[crm crm_state name]
          },
          tests:
          {
            only: %i[test_type test_limits result]
          }
        }
      )
    )

    json.to_json
  end

  get '/patients' do
    Patient.all.to_json
  end

  get '/doctors' do
    Doctor.all.to_json
  end

  post '/import' do
    file = params['file']['tempfile']
    filename = params['file']['filename']

    name = "#{Time.now.to_i}-#{filename}"
    File.open(name, 'a+') do |f|
      f.write(file.read)
    end

    ImportWorker.perform_async(name)
    { import: { status: 'processing' } }.to_json
  end
end
