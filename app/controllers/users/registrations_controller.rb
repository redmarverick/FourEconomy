class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    @header_text = 'REGISTER'
    @button_text = 'NEXT'
    super
  end

  def edit
    @header_text = 'EDIT'
    @button_text = 'Save'
    super
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end