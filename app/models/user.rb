class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :fname, :lname, presence:true, length: { minimum: 3, maximum: 50 }

  def fullname
    "#{self.lname} #{self.fname}"
  end
end
