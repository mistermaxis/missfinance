class NoticesController < ApplicationController
  before_action :authenticate_user!,  except:[:email]

  def success
    redirect_to cats_path if flash.empty?
    @cat_id = params[:id]
  end

  def failure
    redirect_to cats_path if flash.empty?
    @cat_id = params[:id]
  end

  def generic_failure
    redirect_to cats_path if flash.empty?
  end

  def email
    
  end
end
