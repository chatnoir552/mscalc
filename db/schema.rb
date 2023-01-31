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

ActiveRecord::Schema[7.0].define(version: 2022_09_28_121944) do
  create_table "statuses", force: :cascade do |t|
    t.integer "main"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mh_main"
    t.integer "ap_main"
    t.integer "arc_main"
    t.integer "aut_main"
    t.integer "hyper_main"
    t.integer "inner_main"
    t.integer "union_main"
    t.integer "status"
    t.integer "sub"
    t.integer "dame"
    t.integer "final_dame"
    t.float "wepon"
    t.integer "wepon_main_per"
    t.integer "wepon_add_per"
    t.integer "addwepon_main_per"
    t.integer "addwepon_add_per"
    t.integer "em_main_per"
    t.integer "em_add_per"
    t.integer "fb"
    t.integer "union_sub"
  end

end
