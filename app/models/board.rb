class Board < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, presence: true
	self.per_page = 10
end
