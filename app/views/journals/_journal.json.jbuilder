json.extract! journal, :id, :title, :desc, :created_at, :updated_at
json.url journal_url(journal, format: :json)
