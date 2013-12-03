class Export < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :exported_file
  has_attached_file :exported_file, :default_url => "/exported_files/:user_id/:invoice_id/:id"
  belongs_to :invoice
  belongs_to :user
end