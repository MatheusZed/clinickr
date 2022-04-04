require 'csv'
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require './models/test'
require './models/doctor'
require './models/patient'
require './models/exam'
require './models/doctor'
require 'pry'

class Import
  def initialize(file)
    @file = file
  end

  def create
    CSV.foreach(file, headers: true, col_sep: ';') do |row|
      doctor = Doctor.create(
        name: row['nome médico'], email: row['email médico'],
        crm: row['crm médico'], crm_state: row['crm médico estado']
      )
      patient = Patient.create(
        name: row['nome paciente'], cpf: row['cpf'], email: row['email paciente'],
        birthday: row['data nascimento paciente'], city: row['cidade paciente'],
        state: row['estado patiente'], address: row['endereço/rua paciente']
      )
      exam = Exam.create(
        result_token: row['token resultado exame'], result_date: row['data exame'],
        doctor_id: doctor.id, patient_id: patient.id
      )
      Test.create(
        test_type: row['tipo exame'], test_limits: row['limites tipo exame'],
        result: row['resultado tipo exame'], exam_id: exam.id
      )
    end
  end

  attr_reader :file
end
