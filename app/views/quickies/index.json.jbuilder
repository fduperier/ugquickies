json.array!(@quickies) do |quicky|
  json.extract! quicky, :id, :title, :description, :user_group_id, :creator_id
  json.url quicky_url(quicky, format: :json)
end
