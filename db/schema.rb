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

ActiveRecord::Schema.define(:version => 20120221211844) do

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tr8n_glossary", :force => true do |t|
    t.string   "keyword"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_glossary", ["keyword"], :name => "index_tr8n_glossary_on_keyword"

  create_table "tr8n_ip_locations", :force => true do |t|
    t.integer  "low",        :limit => 8
    t.integer  "high",       :limit => 8
    t.string   "registry",   :limit => 20
    t.date     "assigned"
    t.string   "ctry",       :limit => 2
    t.string   "cntry",      :limit => 3
    t.string   "country",    :limit => 80
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_ip_locations", ["high"], :name => "tr8n_il_h"
  add_index "tr8n_ip_locations", ["low"], :name => "tr8n_il_l"

  create_table "tr8n_language_case_rules", :force => true do |t|
    t.integer  "language_case_id", :null => false
    t.integer  "language_id"
    t.integer  "translator_id"
    t.text     "definition",       :null => false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_case_rules", ["language_case_id"], :name => "tr8n_lcr_lc"
  add_index "tr8n_language_case_rules", ["language_id"], :name => "tr8n_lcr_l"
  add_index "tr8n_language_case_rules", ["translator_id"], :name => "tr8n_lcr_t"

  create_table "tr8n_language_case_value_maps", :force => true do |t|
    t.string   "keyword",       :null => false
    t.integer  "language_id",   :null => false
    t.integer  "translator_id"
    t.text     "map"
    t.boolean  "reported"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_case_value_maps", ["keyword", "language_id"], :name => "tr8n_lcvm_kl"
  add_index "tr8n_language_case_value_maps", ["translator_id"], :name => "tr8n_lcvm_t"

  create_table "tr8n_language_cases", :force => true do |t|
    t.integer  "language_id",   :null => false
    t.integer  "translator_id"
    t.string   "keyword"
    t.string   "latin_name"
    t.string   "native_name"
    t.text     "description"
    t.string   "application"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_cases", ["language_id", "keyword"], :name => "tr8n_lc_lk"
  add_index "tr8n_language_cases", ["language_id", "translator_id"], :name => "tr8n_lc_lt"
  add_index "tr8n_language_cases", ["language_id"], :name => "tr8n_lc_l"

  create_table "tr8n_language_forum_abuse_reports", :force => true do |t|
    t.integer  "language_id",               :null => false
    t.integer  "translator_id",             :null => false
    t.integer  "language_forum_message_id", :null => false
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_forum_abuse_reports", ["language_forum_message_id"], :name => "tr8n_lfar_lfm"
  add_index "tr8n_language_forum_abuse_reports", ["language_id", "translator_id"], :name => "tr8n_lfar_lt"
  add_index "tr8n_language_forum_abuse_reports", ["language_id"], :name => "tr8n_lfar_l"

  create_table "tr8n_language_forum_messages", :force => true do |t|
    t.integer  "language_id",             :null => false
    t.integer  "language_forum_topic_id", :null => false
    t.integer  "translator_id",           :null => false
    t.text     "message",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_forum_messages", ["language_id", "language_forum_topic_id"], :name => "tr8n_lfm_ll"
  add_index "tr8n_language_forum_messages", ["language_id"], :name => "tr8n_lfm_l"
  add_index "tr8n_language_forum_messages", ["translator_id"], :name => "tr8n_lfm_t"

  create_table "tr8n_language_forum_topics", :force => true do |t|
    t.integer  "translator_id", :null => false
    t.integer  "language_id"
    t.text     "topic",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_forum_topics", ["language_id"], :name => "tr8n_lft_l"
  add_index "tr8n_language_forum_topics", ["translator_id"], :name => "tr8n_lft_t"

  create_table "tr8n_language_metrics", :force => true do |t|
    t.string   "type"
    t.integer  "language_id",                         :null => false
    t.date     "metric_date"
    t.integer  "user_count",           :default => 0
    t.integer  "translator_count",     :default => 0
    t.integer  "translation_count",    :default => 0
    t.integer  "key_count",            :default => 0
    t.integer  "locked_key_count",     :default => 0
    t.integer  "translated_key_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_metrics", ["created_at"], :name => "tr8n_lm_c"
  add_index "tr8n_language_metrics", ["language_id"], :name => "tr8n_lm_l"

  create_table "tr8n_language_rules", :force => true do |t|
    t.integer  "language_id",   :null => false
    t.integer  "translator_id"
    t.string   "type"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_rules", ["language_id", "translator_id"], :name => "tr8n_lr_lt"
  add_index "tr8n_language_rules", ["language_id"], :name => "tr8n_lr_l"

  create_table "tr8n_language_users", :force => true do |t|
    t.integer  "language_id",                      :null => false
    t.integer  "user_id",                          :null => false
    t.integer  "translator_id"
    t.boolean  "manager",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_language_users", ["created_at"], :name => "tr8n_lu_ca"
  add_index "tr8n_language_users", ["language_id", "translator_id"], :name => "tr8n_lu_lt"
  add_index "tr8n_language_users", ["language_id", "user_id"], :name => "tr8n_lu_lu"
  add_index "tr8n_language_users", ["updated_at"], :name => "tr8n_lu_ua"
  add_index "tr8n_language_users", ["user_id"], :name => "tr8n_lu_u"

  create_table "tr8n_languages", :force => true do |t|
    t.string   "locale",                              :null => false
    t.string   "english_name",                        :null => false
    t.string   "native_name"
    t.boolean  "enabled"
    t.boolean  "right_to_left"
    t.integer  "completeness"
    t.integer  "fallback_language_id"
    t.text     "curse_words"
    t.integer  "featured_index",       :default => 0
    t.string   "google_key"
    t.string   "facebook_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_languages", ["locale"], :name => "tr8n_ll"

  create_table "tr8n_sync_logs", :force => true do |t|
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "keys_sent"
    t.integer  "translations_sent"
    t.integer  "keys_received"
    t.integer  "translations_received"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tr8n_translation_domains", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "source_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_domains", ["name"], :name => "tr8n_td_n", :unique => true

  create_table "tr8n_translation_key_comments", :force => true do |t|
    t.integer  "language_id",        :null => false
    t.integer  "translation_key_id", :null => false
    t.integer  "translator_id",      :null => false
    t.text     "message",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_key_comments", ["language_id", "translation_key_id"], :name => "tr8n_tkc_lt"
  add_index "tr8n_translation_key_comments", ["language_id"], :name => "tr8n_tkc_l"
  add_index "tr8n_translation_key_comments", ["translator_id"], :name => "tr8n_tkc_t"

  create_table "tr8n_translation_key_locks", :force => true do |t|
    t.integer  "translation_key_id",                    :null => false
    t.integer  "language_id",                           :null => false
    t.integer  "translator_id"
    t.boolean  "locked",             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_key_locks", ["translation_key_id", "language_id"], :name => "tr8n_tkl_tl"

  create_table "tr8n_translation_key_sources", :force => true do |t|
    t.integer  "translation_key_id",    :null => false
    t.integer  "translation_source_id", :null => false
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_key_sources", ["translation_key_id"], :name => "tr8n_tks_tk"
  add_index "tr8n_translation_key_sources", ["translation_source_id"], :name => "tr8n_tks_ts"

  create_table "tr8n_translation_keys", :force => true do |t|
    t.string   "type"
    t.string   "key",                              :null => false
    t.text     "label",                            :null => false
    t.text     "description"
    t.datetime "verified_at"
    t.integer  "translation_count"
    t.boolean  "admin"
    t.string   "locale"
    t.integer  "level",             :default => 0
    t.datetime "synced_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_keys", ["key"], :name => "tr8n_tk_k", :unique => true

  create_table "tr8n_translation_source_languages", :force => true do |t|
    t.integer  "language_id"
    t.integer  "translation_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_source_languages", ["language_id", "translation_source_id"], :name => "tr8n_tsl_lt"

  create_table "tr8n_translation_sources", :force => true do |t|
    t.string   "source"
    t.integer  "translation_domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_sources", ["source"], :name => "tr8n_ts_s"

  create_table "tr8n_translation_votes", :force => true do |t|
    t.integer  "translation_id", :null => false
    t.integer  "translator_id",  :null => false
    t.integer  "vote",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translation_votes", ["translation_id", "translator_id"], :name => "tr8n_tv_tt"
  add_index "tr8n_translation_votes", ["translator_id"], :name => "tr8n_tv_t"

  create_table "tr8n_translations", :force => true do |t|
    t.integer  "translation_key_id",                             :null => false
    t.integer  "language_id",                                    :null => false
    t.integer  "translator_id",                                  :null => false
    t.text     "label",                                          :null => false
    t.integer  "rank",                            :default => 0
    t.integer  "approved_by_id",     :limit => 8
    t.text     "rules"
    t.datetime "synced_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translations", ["created_at"], :name => "tr8n_trn_c"
  add_index "tr8n_translations", ["translation_key_id", "translator_id", "language_id"], :name => "tr8n_trn_tktl"
  add_index "tr8n_translations", ["translator_id"], :name => "tr8n_trn_t"

  create_table "tr8n_translator_following", :force => true do |t|
    t.integer  "translator_id"
    t.integer  "object_id"
    t.string   "object_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translator_following", ["translator_id"], :name => "tr8n_tf_t"

  create_table "tr8n_translator_logs", :force => true do |t|
    t.integer  "translator_id"
    t.integer  "user_id",       :limit => 8
    t.string   "action"
    t.integer  "action_level"
    t.string   "reason"
    t.string   "reference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translator_logs", ["created_at"], :name => "tr8n_tl_c"
  add_index "tr8n_translator_logs", ["translator_id"], :name => "tr8n_tl_t"
  add_index "tr8n_translator_logs", ["user_id"], :name => "tr8n_tl_u"

  create_table "tr8n_translator_metrics", :force => true do |t|
    t.integer  "translator_id",                        :null => false
    t.integer  "language_id"
    t.integer  "total_translations",    :default => 0
    t.integer  "total_votes",           :default => 0
    t.integer  "positive_votes",        :default => 0
    t.integer  "negative_votes",        :default => 0
    t.integer  "accepted_translations", :default => 0
    t.integer  "rejected_translations", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translator_metrics", ["created_at"], :name => "tr8n_tm_c"
  add_index "tr8n_translator_metrics", ["translator_id", "language_id"], :name => "tr8n_tm_tl"
  add_index "tr8n_translator_metrics", ["translator_id"], :name => "tr8n_tm_t"

  create_table "tr8n_translator_reports", :force => true do |t|
    t.integer  "translator_id"
    t.string   "state"
    t.integer  "object_id"
    t.string   "object_type"
    t.string   "reason"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translator_reports", ["translator_id"], :name => "tr8n_tr_t"

  create_table "tr8n_translators", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "inline_mode",          :default => false
    t.boolean  "blocked",              :default => false
    t.boolean  "reported",             :default => false
    t.integer  "fallback_language_id"
    t.integer  "rank",                 :default => 0
    t.string   "name"
    t.string   "gender"
    t.string   "email"
    t.string   "password"
    t.string   "mugshot"
    t.string   "link"
    t.string   "locale"
    t.integer  "level",                :default => 0
    t.integer  "manager"
    t.string   "last_ip"
    t.string   "country_code"
    t.integer  "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tr8n_translators", ["created_at"], :name => "tr8n_t_c"
  add_index "tr8n_translators", ["email", "password"], :name => "tr8n_t_ep"
  add_index "tr8n_translators", ["email"], :name => "tr8n_t_e"
  add_index "tr8n_translators", ["user_id"], :name => "tr8n_t_u"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "will_filter_filters", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "will_filter_filters", ["user_id"], :name => "index_will_filter_filters_on_user_id"

end
