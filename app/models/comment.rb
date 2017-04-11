class Comment < ActiveRecord::Base
	validates :sentence, presence: true
	belongs_to :user
	belongs_to :board
	has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
