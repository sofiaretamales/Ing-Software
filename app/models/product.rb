class Product < ApplicationRecord

  include ImageUploader::Attachment(:image)
  has_and_belongs_to_many :requests
  has_many :reviews
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :seller, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :category, presence: true
  has_many :wishlists
  #validates :image, attached: false,
  #                content_type: ['image/png', 'image/jpg', 'image/jpeg']

end
