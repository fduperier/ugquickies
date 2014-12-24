json.array!(@quickies) do |quickie|
  json.extract! quickie, :id, :title, :description, :user_group_id, :creator_id
  json.url quickie_url(quickie, format: :json)
end
