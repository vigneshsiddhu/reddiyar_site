json.array!(@family_relations) do |family_relation|
  json.extract! family_relation, :id
  json.url family_relation_url(family_relation, format: :json)
end
