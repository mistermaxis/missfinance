class CatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Cat.where(author: current_user)
  end

  def show
    @category = Cat.find(params[:id])
    @sums = @category.bills.map do |bill|
      bill.amount
    end
    @total_amount = @sums.sum
  end

  def new
    @cat = Cat.new
  end

  def create
    @category = Cat.new(cat_params)
    @category.author = current_user

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
