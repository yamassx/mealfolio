class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    cooks_path(current_cook.id)
  end

  def after_sign_out_path_for(resource)
    cooks_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:create) do |cook_params|
      cook_params.permit(:nickname, :first_name, :last_name)
    end
    devise_parameter_sanitizer.permit(:create) do |restaurant_params|
      restaurant_params.permit(:name, :greeting)
    end
  end

end


