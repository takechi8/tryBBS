class Comment < ActiveRecord::Base
	validates:sentence, presence:true
	belongs_to :user
end
