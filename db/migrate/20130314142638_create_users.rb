class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :address
      t.string :accountNumber
      t.string :bankName
      t.string :bankNumber
      t.string :ikNumber
      t.string :mobileNumber
      t.string :phoneNumber
      t.string :taxNumber

      t.timestamps
    end
  end
end
