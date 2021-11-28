class Tag < ApplicationRecord
  has_many   :tag_relationships, dependent: :destroy
  has_many   :users, through: :tag_relationships
  validates :name, uniqueness: true, length: { minimum: 1, maximum: 50 }
end
