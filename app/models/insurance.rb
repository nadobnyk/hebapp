class Insurance < ActiveRecord::Base
  attr_accessible :address, :name, :number
  has_many :patients
  #validates :number, length: {is: 9}, allow_blank: false
end
