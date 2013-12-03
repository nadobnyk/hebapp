class CostType < ActiveRecord::Base
  attr_accessible :interval, :number, :prize, :type_class, :description, :title
  has_many :costItems
  TYPES = ["plain", "hourly", "driving"]
end
