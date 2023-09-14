class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :store_previous_page, only: [:new]

  def store_previous_page
    session[:previous_page] = request.referer
  end
end
