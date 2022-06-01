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

    @cat_id = bill_params[:cat_bill][:cat_id]

    @category = Cat.find(@cat_id)

    if @bill.save
      @bill.cats << @category
      redirect_to success_path(@cat_id), notice: "Transaction \"#{@bill.name}\" was created successfully"
    else
      redirect_to notices_failure_path, notice: "There was an error while saving transaction \"#{@bill.name}\""
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :amount, cat_bill: {})
  end
end
