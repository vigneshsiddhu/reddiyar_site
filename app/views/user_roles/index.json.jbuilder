json.array!(@user_roles) do |user_role|
  json.extract! user_role, :id, :role, :user_id
  json.url user_role_url(user_role, format: :json)
end
