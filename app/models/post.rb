class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
