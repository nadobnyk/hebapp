class UpdateCostItems < ActiveRecord::Migration
  def up
  	change_table :cost_items do |t|
	  t.date :startTime
	  t.date :endTime
	end
  end

  def down
  end
end
