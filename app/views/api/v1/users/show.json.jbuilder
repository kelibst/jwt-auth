json.id @user.id
json.username @user.username

json.body do
  json.email @user.email
  json.age @user.age
end
json.confirmation_token @user.confirmation_token unless @user.email_confirmed

json.dates do
  json.confirmed_date @user.confirmed_at if @user.email_confirmed
  json.created_at @user.created_at
  json.updated_at @user.updated_at
end
