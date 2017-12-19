class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :track_visit
  after_action :track_action

  protected

  def track_visit
    ahoy.track_visit
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  
  def track_action
    Ahoy.quiet = false
    ahoy.track "Viewed #{controller_path}##{action_name}", params: request.path_parameters
  end
end
