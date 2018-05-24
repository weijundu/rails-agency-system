require 'open-uri'

class ProfilesController < ApplicationController

  before_action :set_profile, only:[:show, :edit, :update, :delete]

  def index
    if current_user.role == "host"
      if params[:loc_search].blank?
        @profiles = policy_scope(Profile)
        @profiles = [""] if @profiles == nil
      elsif params[:loc_search].match(/\A[a-z]+\d+/)
        json = JSON.parse(open("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:loc_search]}&key=AIzaSyBWlO4s372Rv78tUsPdBLt5c3m7jBlnuGE").read)
        @lat = json["results"][0]["geometry"]["location"]["lat"]
        @lng = json["results"][0]["geometry"]["location"]["lng"]
        @profiles = policy_scope(Profile).where.not(latitude: nil, longitude: nil, first_name: nil).near([@lat, @lng], 5)

      else
        sql_query = " \
        profiles.borough @@ :loc_search \
        OR profiles.address @@ :loc_search \
        "
        @profiles = policy_scope(Profile).where.not(latitude: nil, longitude: nil, first_name: nil).where(sql_query, loc_search: "%#{params[:loc_search]}%")
      end
        @markers = @profiles.map do |profile|
        {
          lat: profile.latitude,
          lng: profile.longitude
        }
        end
    else
      @profiles = [current_user]
    end
  end

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(params_profile)
    @profile.user = current_user
    authorize @profile
    @profile.save
    redirect_to profile_path(@profile)
  end

  def show

  end

  def edit

  end

  def update
    @profile.update(params_profile)
    redirect_to profile_path(@profile)
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def params_profile
    params.require(:profile).permit(:first_name, :last_name, :trade, :skills, :borough, :cv, :address)
  end

end
