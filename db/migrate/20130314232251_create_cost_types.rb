class CreateCostTypes < ActiveRecord::Migration
  def change
    create_table :cost_types do |t|
      t.text :description
      t.integer :interval
      t.string :number
      t.decimal :prize
      t.string :type_class

      t.timestamps
    end
  end
end
