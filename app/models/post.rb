class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, :text, :images, presence: true
end
