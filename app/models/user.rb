class User < ActiveRecord::Base

  has_many :workouts
  has_many :exercises

  validates :password,
            presence: true,
            confirmation: true,
            length: { minimum: 5, maximum: 16 }

  validates :username,
            :uniqueness => {
                :case_sensitive => false
            }
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
