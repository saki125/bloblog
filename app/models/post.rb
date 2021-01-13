class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  with_options presence: true do
    validates :title
    validates :text
    validates :images
  end
end
