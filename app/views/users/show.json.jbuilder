json.user do
  json.id @user.id
  json.name @user.name
  json.mail @user.mail
  json.url user_url(@user)
  json.experiences do
    json.array! @user.experiences do |experience|
      json.name experience.name
      json.url experience_url(experience)
    end
  end
end
