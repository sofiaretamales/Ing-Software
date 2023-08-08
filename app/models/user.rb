class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 9, :maximum => 9 }
  validates :image, attached: false,
                  content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats, dependent: :destroy
  has_many :wishlists



end
