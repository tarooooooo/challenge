class PayPost < ApplicationRecord
  belongs_to :post
  with_options presence: true do
    validates :price, numericality: {greater_than_or_equal_to: 100, less_than: 1000000}
  end
end
