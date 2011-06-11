class UsersController < ApplicationController

  def signup
    if request.post?
      @user = User.new(params[:user])
      #Generate a 4 digit random token
      @user.token = 1000 + rand(9000)
      
      if @user.save
        #send email to the user
        UserMailer.welcome_email(@user).deliver
        render 'notify'
      else
        render 'signup'
      end
    else
      #get request
      @user = User.new
    end
  end

  def info
  end
  
  def notify
  end

  def jobs
  end

end
