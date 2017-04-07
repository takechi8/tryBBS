class Board < ActiveRecord::Base
	belongs_to :user
	belongs_to :board
	has_many :comments
	validates:title, presence:true
end
