# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_01_193533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "dns_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ipv4", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ipv4"], name: "index_dns_records_on_ipv4", unique: true
  end

  create_table "hostnames", force: :cascade do |t|
    t.string "address", null: false
    t.uuid "dns_records_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_hostnames_on_address", unique: true
    t.index ["dns_records_id"], name: "index_hostnames_on_dns_records_id"
  end

end
