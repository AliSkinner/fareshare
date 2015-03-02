class User < ActiveRecord::Base

  has_many :invoices, through: :groups
  has_many :allocations
  has_and_belongs_to_many :groups

end
