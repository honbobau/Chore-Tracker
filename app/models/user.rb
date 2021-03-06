class User < ActiveRecord::Base
	has_many :chores
  has_many :comments

	belongs_to :group
  
	validates :user_name, presence: true, 
												uniqueness: true,
												length: {in: 3..16}
	validates :password, presence: true,
											 confirmation: true
	validates :password_confirmation, presence: true,
																		on: :create

	def total_score
		completed_chores = self.chores.select {|chore| chore[:completed] == true}
		completed_chores.inject(0) {|sum, chore| sum + chore[:difficulty]}
	end
end