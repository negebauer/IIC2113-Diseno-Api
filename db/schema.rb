# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database,
# and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach
# (the more migrations you'll amass, the slower it'll run and the greater
# likelihood for issues).
#
# It's strongly recommended that you check this file
# into your version control system.

ActiveRecord::Schema.define(version: 20_170_926_035_832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'choices', force: :cascade do |t|
    t.string 'reasons'
    t.bigint 'selection_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['selection_id'], name: 'index_choices_on_selection_id'
  end

  create_table 'communicates', force: :cascade do |t|
    t.bigint 'evaluate_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['evaluate_id'], name: 'index_communicates_on_evaluate_id'
  end

  create_table 'difussions', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'path'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_difussions_on_plan_id'
  end

  create_table 'evaluates', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'experiences', force: :cascade do |t|
    t.string 'name'
    t.date 'date'
    t.string 'description'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_experiences_on_user_id'
  end

  create_table 'feedbacks', force: :cascade do |t|
    t.string 'message'
    t.string 'type'
    t.bigint 'realize_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['realize_id'], name: 'index_feedbacks_on_realize_id'
  end

  create_table 'goals', force: :cascade do |t|
    t.string 'when'
    t.string 'how'
    t.string 'description'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_goals_on_plan_id'
  end

  create_table 'methodologies', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'video'
    t.string 'link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'plans', force: :cascade do |t|
    t.string 'name'
    t.bigint 'choice_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['choice_id'], name: 'index_plans_on_choice_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'question'
    t.string 'type'
    t.bigint 'survey_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['survey_id'], name: 'index_questions_on_survey_id'
  end

  create_table 'realizes', force: :cascade do |t|
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_realizes_on_plan_id'
  end

  create_table 'resources', force: :cascade do |t|
    t.string 'name'
    t.string 'support'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_resources_on_plan_id'
  end

  create_table 'selections', force: :cascade do |t|
    t.string 'applicable'
    t.string 'usefulness'
    t.string 'relevance'
    t.string 'feasibility'
    t.bigint 'experience_id'
    t.bigint 'methodologies_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['experience_id'], name: 'index_selections_on_experience_id'
    t.index ['methodologies_id'], name: 'index_selections_on_methodologies_id'
  end

  create_table 'surveys', force: :cascade do |t|
    t.string 'title'
    t.bigint 'evaluate_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['evaluate_id'], name: 'index_surveys_on_evaluate_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'choices', 'selections'
  add_foreign_key 'communicates', 'evaluates'
  add_foreign_key 'difussions', 'plans'
  add_foreign_key 'experiences', 'users'
  add_foreign_key 'feedbacks', 'realizes'
  add_foreign_key 'goals', 'plans'
  add_foreign_key 'plans', 'choices'
  add_foreign_key 'questions', 'surveys'
  add_foreign_key 'realizes', 'plans'
  add_foreign_key 'resources', 'plans'
  add_foreign_key 'selections', 'experiences'
  add_foreign_key 'selections', 'methodologies', column: 'methodologies_id'
  add_foreign_key 'surveys', 'evaluates'
end
