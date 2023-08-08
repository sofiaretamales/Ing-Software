class Request < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products
  validates :description, presence: true
  validates :status, presence: true
  validates :request_date, presence: true
end
