class AddStatusToInvoices < ActiveRecord::Migration
  def up
  	change_table :cost_types do |t|
	  t.string :status
	end
  end

  def down
  end
end
