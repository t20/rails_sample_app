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

  def notify
  end
    
  def activate
    @user = User.find_by_id_and_token(params[:id] , params[:token])
    @user.active = true
    if @user.save
      # request.session_options[:user_id] = @user.id
      session[:user_id] = @user.id
      redirect_to '/users/info'
    else
      render notify
    end
  end

  def info
    @user = User.find_by_id(session[:user_id])
    if request.post?
      @user = @user.update_attributes(params[:user])
      redirect_to '/users/moreinfo'
    end
  end
  
  def moreinfo
    @user = User.find_by_id(session[:user_id])
    if request.post?
      @user = @user.update_attributes(params[:user])
      redirect_to '/users/moreinfo'
    end
  end

  def jobs
  end

end
