class User < ActiveRecord::Base
	has_many :chores
	belongs_to :group
	validates :user_name, :password, presence: true
end