class User < ActiveRecord::Base
	has_many :chores
  has_many :comments

	belongs_to :group
  
	validates :user_name, :password, presence: true, uniqueness: true
	validates :user_name, length: {in: 3..20 } 
end