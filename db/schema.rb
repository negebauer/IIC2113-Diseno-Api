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

ActiveRecord::Schema.define(version: 20_171_110_152_855) do
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
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'audience_before'
    t.text 'channel_before'
    t.text 'objective_before'
    t.text 'audience_during'
    t.text 'channel_during'
    t.text 'objective_during'
    t.text 'audience_after'
    t.text 'channel_after'
    t.text 'objective_after'
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
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'experiences_users', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'experience_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['experience_id'], name: 'index_experiences_users_on_experience_id'
    t.index ['user_id'], name: 'index_experiences_users_on_user_id'
  end

  create_table 'goals', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'when'
    t.string 'how'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'plan_id'
    t.index ['plan_id'], name: 'index_goals_on_plan_id'
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
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'experience_id'
    t.index ['experience_id'], name: 'index_plans_on_experience_id'
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
    t.text 'how'
    t.boolean 'available'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_resources_on_plan_id'
  end

  create_table 'roles', id: :serial, force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.integer 'resource_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index ['name'], name: 'index_roles_on_name'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource_type_and_resource_id'
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
    t.string 'reasons'
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
    t.string 'token'
    t.string 'password_digest'
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'blogs', 'implements'
  add_foreign_key 'comunicates', 'evaluations'
  add_foreign_key 'diffusions', 'plans'
  add_foreign_key 'evaluations', 'implements'
  add_foreign_key 'experiences_users', 'experiences'
  add_foreign_key 'experiences_users', 'users'
  add_foreign_key 'goals', 'plans'
  add_foreign_key 'implements', 'plans'
  add_foreign_key 'members', 'plans'
  add_foreign_key 'others', 'plans'
  add_foreign_key 'places', 'plans'
  add_foreign_key 'plans', 'experiences'
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
