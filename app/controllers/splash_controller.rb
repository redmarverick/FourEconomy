class SplashController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @is_splash_index = true
    if user_signed_in? # Check if the user is logged in
      redirect_to home_path # Redirect logged-in users to the root path (or any other path)
    else
      # Controller logic for unauthenticated users
    end
  end
end
