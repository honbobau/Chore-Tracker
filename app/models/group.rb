class Group < ActiveRecord::Base
	has_many :users
	has_many :chores, dependent: :destroy
	validates :group_name, presence: true, uniqueness: true, length: {maximum: 20}
end