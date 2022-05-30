class CatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Cat.where(author: current_user)
  end

  def show
    @category = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @category = Cat.new(cat_params)

    if @category.save
      redirect_to cat_path(@category)
    else
      redirect_to cats_path
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :icon)
  end
end
