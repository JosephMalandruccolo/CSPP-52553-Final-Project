class SessionsController < ApplicationController


	def new
	end


	def create
		user = User.find_by_email(params[:email].downcase)
		if user && user.authenticate(params[:password])
			#sign user in and redirect to the user's show page
			sign_in user
			redirect_to user
		else
			#create an error message and redisplay the signin form
			flash[:notice] = 'invalid email/password combo'
			render 'new'
		end
	end


	def destroy
	end




end
