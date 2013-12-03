class CreateCostItems < ActiveRecord::Migration
  def change
    create_table :cost_items do |t|
      t.date :date
      t.float :quantity
      t.references :costType
      t.references :invoice

      t.timestamps
    end
    add_index :cost_items, :costType_id
    add_index :cost_items, :invoice_id
  end
end
