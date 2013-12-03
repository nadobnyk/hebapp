# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130428153429) do

  create_table "cost_items", :force => true do |t|
    t.date     "date"
    t.integer  "quantity"
    t.integer  "costType_id"
    t.integer  "invoice_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.time     "startTime"
    t.time     "endTime"
    t.decimal  "amount"
  end

  add_index "cost_items", ["costType_id"], :name => "index_cost_items_on_costType_id"
  add_index "cost_items", ["invoice_id"], :name => "index_cost_items_on_invoice_id"

  create_table "cost_types", :force => true do |t|
    t.text     "description"
    t.integer  "interval"
    t.string   "number"
    t.decimal  "prize"
    t.string   "type_class"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
  end

  create_table "exports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "exported_file_file_name"
    t.string   "exported_file_content_type"
    t.integer  "exported_file_file_size"
    t.datetime "exported_file_updated_at"
  end

  create_table "insurances", :force => true do |t|
    t.text     "name"
    t.text     "address"
    t.string   "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.date     "date"
    t.string   "number"
    t.decimal  "sum"
    t.integer  "patient_id"
    t.integer  "insurance_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "status"
  end

  add_index "invoices", ["insurance_id"], :name => "index_invoices_on_insurance_id"
  add_index "invoices", ["patient_id"], :name => "index_invoices_on_patient_id"

  create_table "patients", :force => true do |t|
    t.text     "name"
    t.text     "address"
    t.date     "birthday"
    t.date     "birthdayChild"
    t.string   "iknr"
    t.string   "kknr"
    t.integer  "user_id"
    t.integer  "insurance_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "flaged"
  end

  add_index "patients", ["insurance_id"], :name => "index_patients_on_insurance_id"
  add_index "patients", ["user_id"], :name => "index_patients_on_user_id"

  create_table "users", :force => true do |t|
    t.text     "name"
    t.text     "address"
    t.string   "accountNumber"
    t.string   "bankName"
    t.string   "bankNumber"
    t.string   "ikNumber"
    t.string   "mobileNumber"
    t.string   "phoneNumber"
    t.string   "taxNumber"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
