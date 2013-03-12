class StatusesController < ApplicationController

	before_filter :authorize_user

	def authorize_user
    	@user = User.find(session[:user_id])
    	if @user.id != session[:user_id]
      	redirect_to signin_path, notice: "Nice try"
    	end
  	end


	def create
		@user = User.find(session[:user_id])
		@college = College.find(params[:college_id])
		@user.follow!(@college)
		redirect_to @college
	end


	def destroy
		@user = User.find(session[:user_id])
		@college = College.find(params[:college_id])
		@user.unfollow!(@college)
		redirect_to @college
	end


end
