class Chore < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	has_many :comments
	validates :name, presence: true
end