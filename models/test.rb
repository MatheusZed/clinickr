require 'active_record'

class Test < ActiveRecord::Base
  belongs_to :exam
  has_many :patients, through: :exam
  has_many :doctors, through: :exam
end
