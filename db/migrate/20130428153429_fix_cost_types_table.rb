class FixCostTypesTable < ActiveRecord::Migration
  def up
  	remove_column :cost_types, :status
  	add_column :patients, :flaged, :boolean
  end

  def down
  end
end
