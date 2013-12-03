class UpdateCostTypes < ActiveRecord::Migration
  def up
  	change_table :cost_types do |t|
	  t.string :title
	end
  end

  def down
  end
end
