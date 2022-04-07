require 'spec_helper'

RSpec.describe Exam do
  let(:exam) do
    Exam.create(
      result_token: 'ABCD12',
      result_date: '2022-01-01',
      patient_id: 1,
      doctor_id: 1
    )
  end
  let(:patient) { instance_double('Patient', id: 1) }
  let(:doctor) { instance_double('Doctor', id: 1) }
  let(:response) do
    {
      name: 'teste',
      cpf: '123.538.390-43',
      email: 'lkasg@vdiaslg.com',
      birthday: '1970-02-02',
      city: 'Sao Paulo',
      state: 'PR',
      address: 'Rua bagulho'
    }
  end
  let(:expected_response) do
      { 
        birthday: '1970-02-02',
        cpf: '123.538.390-43',
        email: 'lkasg@vdiaslg.com',
        name: 'teste'
      }.transform_keys(&:to_s)
  end

  context '.patient' do
    it 'create json response only with birthday cpf email name' do
      allow(Patient).to receive(:find).with(1).and_return(response)

      expect(exam.patient_response).to eq expected_response
    end
  end
end
