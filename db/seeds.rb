require 'pry'

exams = []
exams_hash = { result_token: SecureRandom.alphanumeric(6), result_date: Time.new(2022), doctor_id: 1, patient_id: 1 }
10.times do
  exams << exams_hash
end
patient = [{ name: 'Paciente teste', cpf: '324.312.482-43', email: 'test@example.com', birthday: '1988-03-01', city: 'Sao Paulo', state: 'SP', address: 'Batatinha123' }]
doctor = [{ name: 'Medico teste', email: 'email@doctor.com', crm: SecureRandom.hex(10), crm_state: 'SP' }]
tests = []
tests_hash = { test_type: 'Covid', test_limits: 35, result: 10, exam_id: 1 }
tests_hash = { test_type: 'Gravidez', test_limits: 90, result: 86, exam_id: 1 }

tests.each do |test|
  tests << tests_hash
end

def populate(data, model_name)
  data.each do |d|
    Module.const_get(model_name).create!(d)
  end
end

populate(patient, 'Patient')
populate(doctor, 'Doctor')
populate(exams, 'Exam')
populate(tests, 'Test')