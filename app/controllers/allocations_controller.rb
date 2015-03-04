class AllocationsController < ApplicationController

  def new
    @allocation = Allocation.new
    @users = current_user.invoices.last.group.users
  end

  def create
    @allocation = Allocation.create(allocation_params)
    UserMailer.invoice_create(@allocation.invoice.group).deliver
    render json: @allocation, status: :created    
  end

  def edit
    @allocation = Allocation.find(params[:id])
  end

  def update
    @allocation = Allocation.find(params[:id])
    amount = @allocation.share
    @allocation.update(allocation_params)
    balance = @allocation.invoice.group.balance
    balance = 0 if balance.nil? 
    new_balance = balance + amount 
    @allocation.invoice.group.update_balance(new_balance)
    render json: @allocation
  end

  def destroy
    @allocation = Allocation.find(params[:id])
    @allocation.destroy
    redirect_to invoices_path
  end

  private
  def allocation_params
    params.require(:allocation).permit(:invoice_id, :user_id, :share, :paid)
  end

end
