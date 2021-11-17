class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  enum is_deleted: { exit: false, not_exit: true }

end