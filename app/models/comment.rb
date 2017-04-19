class Comment < ActiveRecord::Base
	validates :sentence, presence: true
  validates :public_start_date, presence: true
  validates :public_end_date, presence: true
	belongs_to :user
	belongs_to :board
	has_many :comment_imgs
	validate :check_image
	self.per_page = 10

	def check_image()
		if self.comment_imgs.length < 1
			errors.add(:image, "画像を１つ以上選択してください。")
		end
	end

end


