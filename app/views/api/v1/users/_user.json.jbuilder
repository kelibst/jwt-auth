json.id user.id
json.username user.username

json.body do
  json.email user.email
  json.age user.age
end

json.dates do
  json.created_at user.created_at
  json.updated_at user.updated_at
end
