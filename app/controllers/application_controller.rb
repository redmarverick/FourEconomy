class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :store_previous_page, only: [:new]

  def set_current_user
    @user = current_user if user_signed_in?
  end

  def store_previous_page
    session[:previous_page] = request.referer
  end
end
