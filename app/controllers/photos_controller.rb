class PhotosController < ApplicationController

  before_filter :user_logged_in

  def user_logged_in
    if User.find_by_id(session[:user_id]).nil?
      redirect_to signin_path, notice: "Nice try"
    end
  end

  def show

  end

  def new
    @college = College.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @college }
    end
  end

  def create
  end

  def destroy
  end
end
