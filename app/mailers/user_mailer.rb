class UserMailer < ActionMailer::Base
  default :from => "teraom@teraom.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/activate/#{user.id}/#{user.token}"
    mail(:to => user.email,
         :subject => "Activate your account")
  end
end
