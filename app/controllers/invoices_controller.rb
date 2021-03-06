class InvoicesController < ApplicationController

  # before_action :authenticate_user!

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new 
    @invoice = Invoice.new
    @user_admin_groups = current_user.groups.select {|group| if group.created_by == current_user.id then group end}
  end

  def create 
    # binding.pry
    @invoice = Invoice.create(invoice_params)
    render json: @invoice, status: :created

  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    amount = @invoice.amount
    @invoice.update(invoice_params)
    new_balance = @invoice.group.balance - amount

    # new_balance = @invoice.group.balance - amount
    @invoice.group.update_balance(new_balance)
    render json: new_balance, status: :created
    # render json: @invoice, status: :created
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end

  private
  def invoice_params
    params.require(:invoice).permit(:name, :amount, :description, :group_id, :description, :due_date, :paid)
  end

end
