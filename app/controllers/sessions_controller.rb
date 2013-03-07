class SessionsController < ApplicationController


	def new
	end


	def create
		user = User.find_by_email(params[:email])
		if user.present? && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user
		else
			flash[:notice] = 'invalid email/password combo'
			render 'new'
		end
	end


	def destroy
		reset_session
		redirect_to signin_path
	end




end
