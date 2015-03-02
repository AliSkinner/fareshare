class Invoice < ActiveRecord::Base

  belongs_to :group
  has_many :users, through: :group
  has_many :allocations
  
end
