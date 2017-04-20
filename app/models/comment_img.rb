class CommentImg < ActiveRecord::Base
  belongs_to :comment, counter_cache: true
  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
