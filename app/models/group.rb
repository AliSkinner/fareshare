class Group < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :invoices

  def update_balance(new_balance)
    self.update(balance: new_balance)
    # params.require(:group).permit(:balance)
  end 
  
end
