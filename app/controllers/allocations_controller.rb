class AllocationsController < ApplicationController

  def new
    @allocation = Allocation.new
    @users = current_user.invoices.last.group.users
  end

  def create
    @allocation = Allocation.create(allocation_params)
    render json: @allocation, status: :created
  end

  def edit
    @allocation = Allocation.find(params[:id])
  end

  def update
    @allocation = Allocation.update(allocation_params)
    redirect_to invoices_path
  end

  def destroy
    @allocation = Allocation.find(params[:id])
    @allocation.destroy
    redirect_to invoices_path
  end

  private
  def allocation_params
    params.require(:allocation).permit(:invoice_id, :user_id, :percentage)
  end

end
