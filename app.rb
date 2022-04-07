require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require './models/test'
require './models/doctor'
require './models/patient'
require './models/exam'
require_relative './import'
require 'pry'

namespace '/api/v1' do
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
    Import.new(params['file']['tempfile']).create
  end
end
