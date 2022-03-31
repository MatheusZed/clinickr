require 'active_record'

class Doctor < ActiveRecord::Base
  has_many :tests
  has_many :pacients, through: :tests
end
