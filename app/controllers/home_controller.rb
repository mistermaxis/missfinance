class HomeController < ApplicationController
  def index
    redirect_to cats_path if user_signed_in?
  end
end
