class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(user)
    if user.is_a?(User)
      cats_path
    else
      super
    end
  end

  def after_sign_out_path_for(user)
    email_path
  end  

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end
end
