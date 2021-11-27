class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_one :pay_post, dependent: :destroy
  has_one :room, dependent: :destroy
  has_one :order, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :pay_post, allow_destroy: true

  enum is_deleted: { exit: false, not_exit: true }

end