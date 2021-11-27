class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_one :room, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  enum is_deleted: { exit: false, not_exit: true }

end