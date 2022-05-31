class BillsController < ApplicationController
  before_action :authenticate_user!

  def new
    @bill = Bill.new
    @categories = Cat.where(author: current_user)
    @cat_bill = @bill.cat_bills.build
  end

  def create
    @bill = Bill.new(name: bill_params[:name], amount: bill_params[:amount])
    @bill.author = current_user

    @cat_ids = bill_params[:cat_bill][:cat_id].select do |id|
      id.present?
    end
    
    @categories = Cat.where(id: @cat_ids)
    
    if @bill.save
      @bill.cats << @categories
      redirect_to cat_path(@cat_ids.first), notice: "Transaction \"#{@bill.name}\" was created successfully"
    else
      redirect_to cats_path, notice: "There was an error while saving transatcion \"#{@bill.name}\""
    end

  end

  private

  def bill_params
    params.require(:bill).permit(:name, :amount, cat_bill: { cat_id: [] })
  end
end
