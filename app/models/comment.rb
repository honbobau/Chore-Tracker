class Comment < ActiveRecord::Base
	belongs_to :chore
  belongs_to :user
end