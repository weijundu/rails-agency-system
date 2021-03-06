require 'open-uri'

class ProfilesController < ApplicationController

  before_action :set_profile, only:[:show, :edit, :update, :destroy]

  def index
    @user = current_user
    if current_user.role == "host"
      if params[:location].present?
        @profiles = policy_scope(Profile).near(params[:location], 8)
      else
        @profiles = policy_scope(Profile).all
      end
      @markers = @profiles.map do |profile|
        {
          lat: profile.latitude,
          lng: profile.longitude
        }
      end
      if params[:trade].present?
        @profiles = policy_scope(Profile).where("trade ILIKE ?", "%#{params[:trade]}%")
      else
        @profiles = policy_scope(Profile).all
      end
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
    @review = Review.new
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
    params.require(:profile).permit(:first_name, :last_name, :trade, :skills, :borough, :cv, :address, :image)
  end

  def comparing_date
    unless params[:start_date].blank? || params[:end_date].blank?
      @profiles = @profiles.select do |profile|
        comparison = Array.new;
        profile.contracts.each do |p|
          if p.start == nil || p.finished ==nil
            comparison << p
          else
            range = (p.start..p.finished)
             comparison << p unless (range.include? params[:start_date].to_date) || (range.include? params[:end_date].to_date)

          end
        end
        profile.contracts.count == comparison.count
      end
    end
  end

end
