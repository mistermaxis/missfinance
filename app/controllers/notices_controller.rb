class NoticesController < ApplicationController
  before_action :authenticate_user!

  def success
    if flash.empty?
      redirect_to cats_path
    end
  end

  def failure
    if flash.empty?
      redirect_to cats_path
    end
  end
end
