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

  with_options presence: true do
    validates :title, length: { minimum: 1, maximum: 50 }
    validates :body, length: { minimum: 1, maximum: 3000 }
    validates :meeting_at
    validates :limit
  end


end