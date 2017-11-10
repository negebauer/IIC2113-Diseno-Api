json.implement do
  json.id @implement.id
  json.plan_id @implement.plan_id
  json.blog do
    json.id @implement.blog.id
    json.day_before @implement.blog.day_before
    json.day_after @implement.blog.day_after
    json.change @implement.blog.change
    json.obs @implement.blog.obs
    json.advances @implement.blog.advances
    json.obstacles @implement.blog.obstacles
    json.ideas @implement.blog.ideas
    json.url implement_blog_url(@implement, @implement.blog)
  end
end
