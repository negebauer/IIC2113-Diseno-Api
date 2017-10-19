json.extract! survey, :id, :evaluation_id, :result, :created_at, :updated_at
json.url survey_url(survey, format: :json)
