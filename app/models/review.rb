
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :body, presence: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

end
