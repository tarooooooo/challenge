class Room < ApplicationRecord
  belongs_to :post
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries
end
