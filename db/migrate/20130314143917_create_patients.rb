class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.text :name
      t.text :address
      t.date :birthday
      t.date :birthdayChild
      t.string :iknr
      t.string :kknr

      t.references :user
      t.references :insurance

      t.timestamps
    end
    add_index :patients, :user_id
    add_index :patients, :insurance_id
  end
end
