json.plan do
  json.id @plan.id
  json.goals do
    json.array! @plan.goals do |goal|
      json.id goal.id
      json.name goal.name
      json.description goal.description
      json.when goal.when
      json.how goal.how
    end
  end
  json.resources do
    json.array! @plan.resources do |resource|
      json.id resource.id
      json.name resource.name
      json.available resource.available
      json.how resource.how
    end
  end
  json.diffusion do
    json.id @plan.diffusion.id
    json.audience_before @plan.diffusion.audience_before
    json.audience_during @plan.diffusion.audience_during
    json.audience_after @plan.diffusion.audience_after
    json.channel_before @plan.diffusion.channel_before
    json.channel_during @plan.diffusion.channel_during
    json.channel_after @plan.diffusion.channel_after
    json.objective_before @plan.diffusion.objective_before
    json.objective_during @plan.diffusion.objective_during
    json.objective_after @plan.diffusion.objective_after
  end
end
