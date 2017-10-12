class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.post.max_content}
  validate  :picture_size
  default_scope ->{order(created_at: :desc)}

  private
  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > Settings.post.picture_size.megabytes
      errors.add(:picture, t("micropost.size_img_error", number: Settings.post.picture_size))
    end
  end
end
