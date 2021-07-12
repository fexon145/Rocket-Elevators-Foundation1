class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_one :customer
  has_one :employee
  def is_employee?(user)
    if user.employee
      return true
    else
      return false
    end
  end
end
