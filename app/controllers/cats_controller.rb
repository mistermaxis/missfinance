class CatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Cat.where(author: current_user)
  end

  def show
    @category = Cat.find_by(id: params[:id])

    if @category.nil?
      redirect_to cats_path, notice: "Category with id: #{params[:id]} does not exist"
    elsif @category.author != current_user
      redirect_to cats_path, notice: "Category with id: #{params[:id]} does not belong to this user"
    else
      @total_amount = @category.bills.map(&:amount).sum
    end
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
