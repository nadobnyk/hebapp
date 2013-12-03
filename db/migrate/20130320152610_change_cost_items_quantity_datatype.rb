class ChangeCostItemsQuantityDatatype < ActiveRecord::Migration
 def up
  	change_column :cost_items, :quantity, :integer 
  end

  def down
  end
end
