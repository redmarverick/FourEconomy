class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @header_text = 'TRANSACTIONS'
  end
end
