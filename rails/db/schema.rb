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

ActiveRecord::Schema[7.0].define(version: 2023_09_19_071018) do
  create_table "audit_areas", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "branches_id"
    t.bigint "cities_id"
    t.index ["branches_id"], name: "index_audit_areas_on_branches_id"
    t.index ["cities_id"], name: "index_audit_areas_on_cities_id"
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "companies_id"
    t.string "name", null: false
    t.string "logo_url", null: false
    t.string "post_code", null: false
    t.bigint "prefectures_id"
    t.bigint "cities_id"
    t.string "address", null: false
    t.string "phone"
    t.string "fax"
    t.string "business_hours"
    t.string "holidays"
    t.string "catchcopy", null: false
    t.string "introduction", null: false
    t.index ["cities_id"], name: "index_branches_on_cities_id"
    t.index ["companies_id"], name: "index_branches_on_companies_id"
    t.index ["prefectures_id"], name: "index_branches_on_prefectures_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "yomi", null: false
    t.bigint "prefectures_id"
    t.index ["prefectures_id"], name: "index_cities_on_prefectures_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
  end

end
