class CitiesController < ApplicationController


  before_filter :admin_user, :only => [:index, :import, :save]

  def admin_user
    @user = User.find(session[:user_id])
    if !@user.admin?
      redirect_to signin_path, notice: "Nice try"
    end
  end

  def autocomplete_index
    @cities = City.order(:city).where("CITY like ?", "#{params[:term]}%")
    render json: @cities.map { |city| "#{city.city.titleize}, #{city.state}" }
  end

  def index
    @cities = City.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities.map(&:city) }
    end
  end

  def import
  end


  def save
    City.import(params[:file])
    redirect_to 'listCities', notice:"Cities imported"
  end
  
end
