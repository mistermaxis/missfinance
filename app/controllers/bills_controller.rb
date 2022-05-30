class BillsController < ApplicationController
  before_action :authenticate_user!

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.author = current_user
    @bill.cats.append(Cat.first)

    if @bill.save
      redirect_to bill_path(@bill)
    else
      redirect_to bills_path
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :amount)
  end
end
