class ChangeCostItemsDatatypes < ActiveRecord::Migration
  def up
  	change_column :cost_items, :startTime, :time 
  	change_column :cost_items, :endTime, :time 
  end

  def down
  end
end
