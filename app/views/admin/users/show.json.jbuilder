json.user do
  json.id @user.id
  json.name @user.name
  json.mail @user.mail
  json.created_at @user.created_at
  json.updated_at @user.updated_at
  json.url user_url(@user)
  json.experiences do
    json.array! @user.experiences do |experience|
      json.name experience.name
      json.url experience_url(experience)
    end
  end
end
