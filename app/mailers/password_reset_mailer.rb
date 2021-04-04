class PasswordResetMailer < ApplicationMailer
  default from: 'kbooster17@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_password_reset_email(user)
    @user = user

    mail(to: @user.email,
         subject: "#{@user.email} requested a password reset!")
  end
end
