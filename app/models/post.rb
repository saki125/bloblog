class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes

  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
