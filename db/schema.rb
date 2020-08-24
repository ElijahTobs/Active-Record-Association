ActiveRecord::Schema.define(version: 2020_08_24_141426) do

  create_table "event_attendees", force: :cascade do |t|
    t.integer "event_id"
    t.integer "attendee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_event_attendees_on_attendee_id"
    t.index ["event_id"], name: "index_event_attendees_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
    t.text "description"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password"
    t.datetime "remember_created_at"
  end

end
