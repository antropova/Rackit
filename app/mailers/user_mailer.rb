class UserMailer < ApplicationMailer

  def registration_confirmation(user)
    @user = user
    # attachments["bike_icon.png"] = File.read("")
    mail(to: @user.email, subject: "Registered")
  end
end
