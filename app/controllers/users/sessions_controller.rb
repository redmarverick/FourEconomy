class Users::SessionsController < Devise::SessionsController
  def new
    @header_text = 'LOGIN'
    @button_text = 'Log In'
    super
  end
end
