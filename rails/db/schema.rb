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

ActiveRecord::Schema[7.0].define(version: 2023_09_20_044732) do
  create_table "assesment_areas", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_assesment_areas_on_branch_id"
    t.index ["city_id"], name: "index_assesment_areas_on_city_id"
  end

  create_table "assesments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "prefecture_id"
    t.bigint "city_id"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "tel", null: false
    t.string "email", null: false
    t.string "address", null: false
    t.integer "building_type", null: false
    t.integer "exclusive_area", null: false
    t.integer "land_area", null: false
    t.integer "building_area", null: false
    t.integer "room_plan_type", null: false
    t.integer "constructed_year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_assesments_on_branch_id"
    t.index ["city_id"], name: "index_assesments_on_city_id"
    t.index ["prefecture_id"], name: "index_assesments_on_prefecture_id"
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "prefecture_id"
    t.bigint "city_id"
    t.string "name", null: false
    t.string "logo_url", null: false
    t.string "post_code", null: false
    t.string "address", null: false
    t.string "tel"
    t.string "fax"
    t.string "business_hours_text", comment: "営業時間 <ex: 平日9:00-18:00>"
    t.string "holidays_text", comment: "<ex: 水曜日、祝日>"
    t.string "catchcopy", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
    t.index ["prefecture_id"], name: "index_branches_on_prefecture_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "prefecture_id"
    t.string "name", null: false
    t.string "yomi", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "prefecture_id"
    t.bigint "city_id"
    t.string "name", null: false
    t.integer "gender", null: false
    t.integer "age", null: false
    t.string "address", null: false
    t.integer "building_type", null: false
    t.integer "times_type", null: false
    t.date "consider_season", null: false
    t.date "assesment_season", null: false
    t.date "po_season", null: false
    t.date "sale_season", null: false
    t.date "delivery_season", null: false
    t.integer "speed_cs", null: false
    t.integer "assesment_price", null: false
    t.integer "sale_price", null: false
    t.boolean "is_price_down", default: false, null: false
    t.integer "price_down_month"
    t.integer "price_down_amount"
    t.integer "close_price", null: false
    t.integer "price_cs", null: false
    t.integer "contract_type", null: false
    t.string "title", null: false
    t.integer "sale_reason_type", null: false
    t.string "anxiety", null: false
    t.string "decision_reason", null: false
    t.integer "support_cs", null: false
    t.string "support_reason", null: false
    t.string "advice", null: false
    t.string "request", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_reviews_on_branch_id"
    t.index ["city_id"], name: "index_reviews_on_city_id"
    t.index ["prefecture_id"], name: "index_reviews_on_prefecture_id"
  end

end
