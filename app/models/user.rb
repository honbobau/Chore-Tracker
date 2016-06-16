class User < ActiveRecord::Base
	has_many :chores
  has_many :comments

	belongs_to :group
  
	validates :user_name, presence: true, 
												uniqueness: true,
												length: {in: 3..20}
	validates :password, presence: true,
											 confirmation: true
	validates :password_confirmation, presence: true,
																		on: :create

end