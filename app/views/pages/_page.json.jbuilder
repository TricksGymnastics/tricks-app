json.extract! page, :id, :title, :url, :start_time, :end_time, :created_at, :updated_at
json.url page_url(page, format: :json)
