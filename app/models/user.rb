class User < ApplicationRecord
  has_many :customers
  has_many :employees
  
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
    def current_admin
    current_user && current_user.employee
    end

    def full_name
      self.first_name + " " + self.last_name.to_s    
    end

end
