class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(active_)?admin)|(^pages$)/
  end

  def after_sign_in_path_for(resource)
    if current_user.role == "host"
      if current_user.company == nil
        new_company_path
      else
        request.env['omniauth.origin'] || options_path
      end
    elsif current_user.role == "apprentice"
      if current_user.profile == nil
        new_profile_path
      else
        request.env['omniauth.origin'] || options_path
      end
    else
      request.env['omniauth.origin'] || options_path
    end
  end
end
