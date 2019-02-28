class Api::UsersController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
		render json: User.all
	end

	def create
		@user=User.new(user_params)
		if @user.save
			render json: {
			status: 200,
			message: "Successfully created the user",
			User: @user
			}.to_json
		else
			render json: {
			status: 500,
			message: "Failed",
			errors: @user.errors
			}.to_json
		end  
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		render json:{
		meassage: "Successfully deleted"
		}
	end

	private
	
	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end