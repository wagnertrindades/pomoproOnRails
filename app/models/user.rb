class User < ActiveRecord::Base

  has_many :timer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
