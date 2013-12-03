class CreateExportsTable < ActiveRecord::Migration
  create_table :exports do |t|
     t.references :user
     t.references :invoice

     t.timestamps
    end
end
