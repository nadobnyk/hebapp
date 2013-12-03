class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :name, :accountNumber, :bankName, :bankNumber, :ikNumber, :mobileNumber, :phoneNumber, :taxNumber
  has_many :patients
  has_many :exports
  #validates :ikNumber, length: {is: 9}, allow_blank: false
end