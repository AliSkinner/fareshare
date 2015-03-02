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
  end

  

  private
  def invoice_params
    params.require(:invoice).permit(:name, :amount, :description, :group_id, :description)
  end

end
