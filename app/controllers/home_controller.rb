class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to cats_path
    end
  end
end
