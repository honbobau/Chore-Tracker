class User < ActiveRecord::Base
	has_many :chores
	belongs_to :group
end