class User < ActiveRecord::Base
	has_many :chores
	belongs_to :group
	validates :user_name, :password, presence: true, uniqueness: true
	validates :user_name, length: {in: 3..20 } 

end