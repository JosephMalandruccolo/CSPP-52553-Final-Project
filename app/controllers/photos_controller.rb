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
    @photo = Photo.new

    @college_id = @college.id
    @college_name = @college.shortName

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @college }
    end
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.college_id = params[:college_id]
    @photo.user_id = params[:user_id]

    @college = College.find_by_id(@photo.college_id)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @college, notice: 'Photo was successfully uploaded' }
        format.json { render json: @college, status: :created, location: @college }
      else
        format.html { render action: "new" }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end
end
