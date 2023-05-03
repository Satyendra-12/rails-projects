class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :vehicles
  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

        #  def self.reset_password_by_token(attributes)
        #   token = attributes[:reset_password_token]
        #   user = find_by(reset_password_token: token)
      
        #   if user&.reset_password_period_valid?
        #     user.update(password: attributes[:password], password_confirmation: attributes[:password_confirmation], reset_password_token: nil)
        #   else
        #     user ||= User.new
        #     user.errors.add(:reset_password_token, 'is invalid')
        #   end
      
        #   user
        # end
        validates :email, presence: true, uniqueness: true
        validates :encrypted_password, presence: true
        validates :first_name, presence: true
        validates :last_name, presence: true
        validates :dob, presence: true
        validates :title, presence: true
        validates :phone_number, presence: true
        
        def self.find_for_database_authentication(warden_conditions)
          conditions = warden_conditions.dup
          if login = conditions.delete(:login)
            where(conditions.to_h).where(["lower(email) = :value OR lower(username) = :value", { :value => login.downcase }]).first
          else
            where(conditions.to_h).first
          end
        end
# def jwt_payload
#   super
# end
end