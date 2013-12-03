class AddStatusToInvoicesRedo < ActiveRecord::Migration
  def up
  	change_table :invoices do |t|
	  t.string :status
	end
  end

  def down
  	change_table :cost_types do |t|
	  t.string :status
	end
  end
end
