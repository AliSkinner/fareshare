class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invoices, through: :groups
  has_many :allocations
  has_and_belongs_to_many :groups

  include Gravtastic
    gravtastic size: 120, default: "identicon"

end
