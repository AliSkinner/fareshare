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
    @invoice = Invoice.create()
  end

end
