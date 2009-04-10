# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 2) do

  create_table "pages", :force => true do |t|
    t.column "title",        :string,   :default => "", :null => false
    t.column "seo_title",    :string,   :default => "", :null => false
    t.column "contents",     :text
    t.column "created_on",   :datetime
    t.column "updated_on",   :datetime
    t.column "lock_version", :integer,  :default => 0
  end

  add_index "pages", ["title"], :name => "index_pages_on_title"
  add_index "pages", ["seo_title"], :name => "index_pages_on_seo_title"

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
