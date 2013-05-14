json.array! @articles do |article|
  json.id article, :id
  json.title article, :title
  json.body article, :body
  json.show_url article_url(article)

  json.comments article.comments do |json, comment|
    json.(comment, :author_name, :article_id)
  end
end