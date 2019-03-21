class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf, :category_id])
  end

  def current_contractor_or_user
    current_contractor || current_user
  end
end
