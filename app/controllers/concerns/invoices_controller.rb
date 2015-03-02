class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new 
    @invoice = Invoice.new
  end

  def create 
    @invoice = Invoice.create(invoice_params)
    redirect_to invoices_path
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.update(invoice_params)
    redirect_to invoices_path
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end

  private
  def invoice_params
    params.require(:invoice).permit(:name, :amount, :description, :group_id, :description)
  end

end
