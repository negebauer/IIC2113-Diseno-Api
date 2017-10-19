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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_171_019_035_745) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'blogs', force: :cascade do |t|
    t.bigint 'implement_id'
    t.date 'day_before'
    t.text 'change'
    t.date 'day_after'
    t.text 'obs'
    t.text 'advances'
    t.text 'obstacles'
    t.text 'ideas'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['implement_id'], name: 'index_blogs_on_implement_id'
  end

  create_table 'comunicates', force: :cascade do |t|
    t.bigint 'evaluation_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['evaluation_id'], name: 'index_comunicates_on_evaluation_id'
  end

  create_table 'diffusions', force: :cascade do |t|
    t.text 'before'
    t.text 'during'
    t.text 'after'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_diffusions_on_plan_id'
  end

  create_table 'evaluations', force: :cascade do |t|
    t.bigint 'implement_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['implement_id'], name: 'index_evaluations_on_implement_id'
  end

  create_table 'experiences', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.date 'date'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_experiences_on_user_id'
  end

  create_table 'implements', force: :cascade do |t|
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_implements_on_plan_id'
  end

  create_table 'members', force: :cascade do |t|
    t.string 'name'
    t.string 'role'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_members_on_plan_id'
  end

  create_table 'methoods', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.string 'video'
    t.string 'link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'others', force: :cascade do |t|
    t.string 'item'
    t.text 'how'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_others_on_plan_id'
  end

  create_table 'places', force: :cascade do |t|
    t.text 'where'
    t.text 'indentify'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_places_on_plan_id'
  end

  create_table 'plans', force: :cascade do |t|
    t.text 'reasons'
    t.text 'period'
    t.string 'name'
    t.text 'objetive'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'conect'
    t.text 'choice'
    t.text 'planing'
    t.text 'implements'
    t.bigint 'evaluation_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['evaluation_id'], name: 'index_questions_on_evaluation_id'
  end

  create_table 'resources', force: :cascade do |t|
    t.string 'name'
    t.text 'support'
    t.boolean 'disponibility'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_resources_on_plan_id'
  end

  create_table 'satisfactions', force: :cascade do |t|
    t.bigint 'evaluation_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['evaluation_id'], name: 'index_satisfactions_on_evaluation_id'
  end

  create_table 'selection_plans', force: :cascade do |t|
    t.bigint 'plan_id'
    t.bigint 'selection_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_selection_plans_on_plan_id'
    t.index ['selection_id'], name: 'index_selection_plans_on_selection_id'
  end

  create_table 'selections', force: :cascade do |t|
    t.text 'applicable'
    t.text 'usefulness'
    t.text 'relevance'
    t.text 'feasibility'
    t.bigint 'experience_id'
    t.bigint 'methood_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['experience_id'], name: 'index_selections_on_experience_id'
    t.index ['methood_id'], name: 'index_selections_on_methood_id'
  end

  create_table 'suggestions', force: :cascade do |t|
    t.bigint 'evaluation_id'
    t.text 'result'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['evaluation_id'], name: 'index_suggestions_on_evaluation_id'
  end

  create_table 'surveys', force: :cascade do |t|
    t.bigint 'evaluation_id'
    t.text 'result'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['evaluation_id'], name: 'index_surveys_on_evaluation_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'mail'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'blogs', 'implements'
  add_foreign_key 'comunicates', 'evaluations'
  add_foreign_key 'diffusions', 'plans'
  add_foreign_key 'evaluations', 'implements'
  add_foreign_key 'experiences', 'users'
  add_foreign_key 'implements', 'plans'
  add_foreign_key 'members', 'plans'
  add_foreign_key 'others', 'plans'
  add_foreign_key 'places', 'plans'
  add_foreign_key 'questions', 'evaluations'
  add_foreign_key 'resources', 'plans'
  add_foreign_key 'satisfactions', 'evaluations'
  add_foreign_key 'selection_plans', 'plans'
  add_foreign_key 'selection_plans', 'selections'
  add_foreign_key 'selections', 'experiences'
  add_foreign_key 'selections', 'methoods'
  add_foreign_key 'suggestions', 'evaluations'
  add_foreign_key 'surveys', 'evaluations'
end
