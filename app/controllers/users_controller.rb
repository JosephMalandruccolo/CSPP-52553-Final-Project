class UsersController < ApplicationController

  before_filter :authorize_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def authorize_user
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to signin_path, notice: "Nice try"
    end
  end


  def admin_user
    @user = User.find(session[:user_id])
    if !@user.admin?
      redirect_to signin_path, notice: "Nice try"
    end
  end


  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @colleges_following = User.find(@user.id).colleges

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new



    @month_options = []
    Date::MONTHNAMES.slice(1..12).each do |month|
      @month_options.push([month, month])
    end


    @birthYearRange = []
    110.times do |year|
      @birthYearRange.push(Time.now.year - year)
    end


    @unique_states = []
    City.select("DISTINCT(STATE)").each do |state|
      #format [state, state] compatible with rails select
      @unique_states.push([state[:state], state[:state]])
    end


    @hometowns = []

    City.all.each do |town|
      @hometowns.push(["#{town[:city]}, #{town[:state]}", town[:id]])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])

    @month_options = []
    Date::MONTHNAMES.slice(1..12).each do |month|
      @month_options.push([month, month])
    end


    @birthYearRange = []
    110.times do |year|
      @birthYearRange.push(Time.now.year - year)
    end


    @unique_states = []
    City.select("DISTINCT(STATE)").each do |state|
      #format [state, state] compatible with rails select
      @unique_states.push([state[:state], state[:state]])
    end


    @hometowns = []

    City.all.each do |town|
      @hometowns.push(["#{town[:city]}, #{town[:state]}", town[:id]])
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
