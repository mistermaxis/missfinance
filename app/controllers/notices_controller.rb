class NoticesController < ApplicationController
  before_action :authenticate_user!

  def success
    if flash.empty?
      redirect_to cats_path
    end
    @cat_id = params[:id]
  end

  def failure
    if flash.empty?
      redirect_to cats_path
    end
    @cat_id = params[:id]
  end

  def generic_failure
    if flash.empty?
      redirect_to cats_path
    end
  end
end
