class Genre < ApplicationRecord
  has_many :posts
  with_options presence: true do
    validates :name, length: { minimum: 1, maximum: 50 }
    validates :image_id
  end
end
