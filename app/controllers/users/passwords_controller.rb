class Users::PasswordsController < Devise::PasswordsController
  def new
    @header_text = 'FORGOT'
    @button_text = 'Next'
    super
  end

  def edit
    @header_text = 'REDEFINE'
    @button_text = 'Next'
    super
  end
end
