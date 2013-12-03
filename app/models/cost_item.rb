class CostItem < ActiveRecord::Base
  belongs_to :costType
  belongs_to :invoice
  attr_accessible :date, :quantity, :startTime, :endTime, :amount
  validates :date, presence: true
  validates :quantity, numericality: true
  validates :costType, presence: true
end
