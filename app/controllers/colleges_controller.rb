class CollegesController < ApplicationController

  before_filter :admin_user, :only => [:destroy, :edit, :update, :new, :create]

  def admin_user
    @user = User.find(session[:user_id])
    if !@user.admin?
      redirect_to signin_path, notice: "Nice try"
    end
  end

  # GET /colleges
  # GET /colleges.json
  def index
    @colleges = College.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colleges }
    end
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
    @college = College.find(params[:id])
    @college_photos = Photo.where(college_id: params[:id])

    # => twitter api call
    @result = JSON.parse(open("https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=#{@college.twitter}&count=1").read)

    @tweet = @result.first
    @text = @tweet["text"]


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @college }
    end
  end

  # GET /colleges/new
  # GET /colleges/new.json
  def new
    @college = College.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @college }
    end
  end

  # GET /colleges/1/edit
  def edit
    @college = College.find(params[:id])
  end

  # POST /colleges
  # POST /colleges.json
  def create
    @college = College.new(params[:college])

    respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: 'College was successfully created.' }
        format.json { render json: @college, status: :created, location: @college }
      else
        format.html { render action: "new" }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colleges/1
  # PUT /colleges/1.json
  def update
    @college = College.find(params[:id])

    respond_to do |format|
      if @college.update_attributes(params[:college])
        format.html { redirect_to @college, notice: 'College was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    @college = College.find(params[:id])
    @college.destroy

    respond_to do |format|
      format.html { redirect_to colleges_url }
      format.json { head :no_content }
    end
  end
end
