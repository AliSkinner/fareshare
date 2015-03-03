class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :invoices, through: :groups
  has_many :allocations
  has_and_belongs_to_many :groups

  include Gravtastic
    gravtastic size: 120, default: "identicon"

    def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
        data = access_token.info
        user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
        if user
          return user
        else
          registered_user = User.where(:email => access_token.info.email).first
          if registered_user
            return registered_user
          else
            user = User.create(name: data["name"],
              provider:access_token.provider,
              email: data["email"],
              uid: access_token.uid ,
              password: Devise.friendly_token[0,20],
            )
          end
       end
    end

end
