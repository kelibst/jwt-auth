json.token @token
json.exp @time.strftime('%m-%d-%Y %H:%M')
json.username @user.username
json.confirmation_token @user.confirmation_token unless @user.email_confirmed
