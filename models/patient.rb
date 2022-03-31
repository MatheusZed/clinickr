require 'active_record'

class Patient < ActiveRecord::Base
  has_many :tests
  has_many :doctors, through: :tests
end
