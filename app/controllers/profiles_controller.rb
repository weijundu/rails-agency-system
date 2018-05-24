class ProfilesController < ApplicationController

  before_action :set_profile, only:[:show, :edit, :update, :delete]

  def index
    if current_user.role == "host"
      if params[:borough].blank?
        @profiles = policy_scope(Profile)
        @profiles = [""] if @profiles == nil
      else
        @profiles = policy_scope(Profile).where(borough: params[:borough].capitalize)
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
    params.require(:profile).permit(:first_name, :last_name, :trade, :skills, :borough, :cv, :image)
  end

end
