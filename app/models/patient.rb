class Patient < ActiveRecord::Base
  belongs_to :user
  belongs_to :insurance
  has_many :invoices
  attr_accessible :address, :birthday, :birthdayChild, :iknr, :kknr, :name, :flaged

  validates :address, :iknr, :kknr, :name, presence: true
  #validates :iknr, length: {is: 9}, allow_blank: false
end
