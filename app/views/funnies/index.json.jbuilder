json.array!(@funnies) do |funny|
  json.extract! funny, :id, :description
  json.url funny_url(funny, format: :json)
end
