class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.text :name
      t.text :address
      t.string :number

      t.timestamps
    end
  end
end
