class StatusesController < ApplicationController

	before_filter: :authorize_user

	def authorize_user
    	@user = User.find(params[:id])
    	if @user.id != session[:user_id]
      	redirect_to signin_path, notice: "Nice try"
    	end
  	end


	def create
		@user = User.find(params[:status][:user_id])
		@college = College.find(params[:status][:college_id])
		@user.follow!(@college)
		redirect_to @college
	end


	def destroy
		@user = Status.find(params[:id]).user_id
		@college = Status.find(params[:id]).college_id
		@user.unfollow!(@college)
	end


end
