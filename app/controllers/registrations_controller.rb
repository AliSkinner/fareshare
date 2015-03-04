class RegistrationsController < Devise::RegistrationsController

  def create
    super
    binding.pry
    UserMailer.registration_confirmation(current_user).deliver
  end
 
  private
 
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end