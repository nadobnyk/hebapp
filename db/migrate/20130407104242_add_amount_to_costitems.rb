class AddAmountToCostitems < ActiveRecord::Migration
  def up
  	change_table :cost_items do |t|
	  t.decimal :amount
	end
  end
end
