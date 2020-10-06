class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable

  validates :fname, :lname, presence:true, length: { minimum: 3, maximum: 50 }

  has_many :rooms
  has_many :reservations

  def fullname
    "#{self.lname} #{self.fname}"
  end

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    return user unless user.blank?

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fname = auth.info.first_name
      user.lname = auth.info.last_name
      user.image = auth.info.image
      user.uid = auth.uid
      user.provider = auth.provider

      user.skip_confirmation!
    end
  end
end
