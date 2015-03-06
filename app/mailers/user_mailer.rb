class UserMailer < ApplicationMailer
  default from: "donotreply@fareshare.com"

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Thanks For Registering!")
  end


  def invoice_create(group)
    @group = group
    @group.users.each do |user|
      mail(to: user.email, subject: "You have a new Invoice!") do |format|
        format.text
        format.html { render locals: { user: user } }
      end
    end
  end
  
end


