json.selections do
  json.array! @selections do |selection|
    json.id selection.id
    json.applicable selection.applicable
    json.usefulness selection.usefulness
    json.relevance selection.relevance
    json.feasibility selection.feasibility
    json.experience_id selection.experience_id
    json.created_at selection.created_at
    json.updated_at selection.updated_at
    json.url experience_selection_url(selection.experience, selection)
    json.methood do
      json.name selection.methood.name
      json.url selection.methood.link
    end
  end
end
