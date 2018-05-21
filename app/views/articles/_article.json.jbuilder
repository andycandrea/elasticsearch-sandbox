json.extract!(article, :id, :title, :content, :published_on, :created_at, :updated_at)
json.url(rticle_url(article, format: :json)
