require 'active_record'

class Exam < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  has_many :tests

  def patient_response
    JSON.parse(Patient.find(self.patient_id).to_json(only: %i[cpf name email birthday]))
  end
end
