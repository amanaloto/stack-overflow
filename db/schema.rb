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

ActiveRecord::Schema.define(:version => 20140526021348) do

  create_table "answers", :force => true do |t|
    t.string   "name"
    t.text     "answer"
    t.integer  "points",      :default => 0
    t.integer  "question_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "points",     :default => 0
    t.integer  "answer_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "user_id"
  end

  add_index "comments", ["answer_id"], :name => "index_comments_on_answer_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "question"
    t.integer  "points",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "user_id"
  end

  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "vote_questions", :force => true do |t|
    t.integer  "points"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "vote_questions", ["question_id"], :name => "index_vote_questions_on_question_id"
  add_index "vote_questions", ["user_id"], :name => "index_vote_questions_on_user_id"

  create_table "votes", :force => true do |t|
    t.integer  "points",       :default => 0
    t.integer  "user_id"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
