json.extract! blog, :id, :title, :content, :published_at, :user_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
