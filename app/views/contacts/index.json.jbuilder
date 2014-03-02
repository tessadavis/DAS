json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :category, :area, :phone, :website, :email, :info
  json.url contact_url(contact, format: :json)
end
