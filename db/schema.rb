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

ActiveRecord::Schema.define(:version => 20100912191020) do

  create_table "abstract_group_groups", :force => true do |t|
    t.string "name"
  end

  create_table "abstract_group_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
    t.string  "member_type"
  end

  add_index "abstract_group_memberships", ["group_id", "member_id"], :name => "index_abstract_group_memberships_on_group_id_and_member_id"
  add_index "abstract_group_memberships", ["member_id", "member_type"], :name => "index_abstract_group_memberships_on_member_id_and_member_type"

end
