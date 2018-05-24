require 'open-uri'

class ProfilesController < ApplicationController

  before_action :set_profile, only:[:show, :edit, :update, :delete]

  def index
    if params[:loc_search].present?
      @profiles = policy_scope(Profile).near(params[:loc_search], 8)
    else
      @profiles = policy_scope(Profile).all
    end
    @markers = @profiles.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude
      }
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
