class Invoice < ActiveRecord::Base
  belongs_to :patient
  has_one :insurance, :through => :patient
  has_many :costItems
  has_many :exports
  attr_accessible :date, :number, :sum, :status

  STATES = ["new", "pending", "paid"]
end
