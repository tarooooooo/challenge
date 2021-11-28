class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  with_options presence: true do
    validates :content, length: { minimum: 1, maximum: 500 }
  end
end
