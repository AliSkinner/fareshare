class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @allocations = @user.allocations
    unpaid_shares = @allocations.select {|allocation| allocation.paid != true }
    each_user_share = unpaid_shares.map {|allocation| allocation.share}
    binding.pry
    @total_share_amount = each_user_share.reduce(:+)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    UserMailer.registration_confirmation(@user).deliver
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :percentage)
  end

end
