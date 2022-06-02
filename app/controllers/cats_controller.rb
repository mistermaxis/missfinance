class CatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cats = Cat.includes(:bills).where(author: current_user)

    if @cats.present?
      @categories = @cats
      @general_total = @categories.map { |c| c.bills.map(&:amount).sum }.sum
    end
  end

  def show
    @category = Cat.includes(:bills).find_by(id: params[:id])

    if @category.nil?
      redirect_to generic_failure_path, notice: "Category with id: #{params[:id]} does not exist"
    elsif @category.author != current_user
      redirect_to generic_failure_path, notice: "Category with id: #{params[:id]} does not belong to this user"
    else
      @bills = @category.bills.sort { |a, b| b.created_at <=> a.created_at }
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
      redirect_to success_path(@category), notice: "Category \"#{@category.name}\" was created successfully."
    else
      redirect_to generic_failure_path, notice: "There was an error while saving category \"#{@category.name}.\""
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :icon)
  end
end
