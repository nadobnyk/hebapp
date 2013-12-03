class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :date
      t.string :number
      t.decimal :sum
      t.references :patient
      t.references :insurance

      t.timestamps
    end
    add_index :invoices, :patient_id
    add_index :invoices, :insurance_id
  end
end
