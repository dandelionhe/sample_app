class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id,presence:true
  validates :content,presence:true,length:{maximum:140}
  validate :picutre_size

  private
  def picture_size
    if picture_size > 1.megabytes
      errors.add(:picture,"should be smaller than 1MB")
    end
  end
end
