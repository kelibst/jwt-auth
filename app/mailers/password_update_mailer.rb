class PasswordUpdateMailer < ApplicationMailer
    default from: 'kbooster17@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_password_update_email(user)
    @user = user

    mail(to: @user.email,
         subject: "#{@user.email} password update notification!")
  end
end
