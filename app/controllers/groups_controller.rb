class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.new
    respond_to do |format|
      format.html
      format.json {render json: @groups}
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if params[:user]
      @users=params[:user][:user_ids]
        @users.each do |user|
        @group.users << User.find(user)
      end
    end
    render json: @group, :include => {:users => {:only =>:name}}, status: :created
    # redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end 

  def update
    @group = Group.update(group_params)
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
    unpaid_invoices = @group.invoices.select {|invoice| invoice.paid == false }
    unpaid_invoice_not_nil = unpaid_invoices.select {|invoice| invoice.amount != nil }
    unpaid_invoice_amounts = unpaid_invoice_not_nil.map {|invoice| invoice.amount}
    @total_amount = unpaid_invoice_amounts.reduce(:+) 
    @balance = @group.balance
    @leader_id = @group.created_by

  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :balance, {user_ids:[]}, :created_by)
  end

end
