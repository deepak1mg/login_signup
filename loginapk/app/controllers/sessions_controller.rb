class SessionsController < ApplicationController
  def new
  end

  def create
  	user=User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		@current_user=params[:email]
  		redirect_to root_url
  	else
  		render plain:"invalid email or password"
  	end

  end

  def destroy
  	session[:user_id]=nil
  	flash[:notice]="you have logged out"
  	redirect_to root_url
  end
end
