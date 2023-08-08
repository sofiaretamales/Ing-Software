class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  has_many :chats, dependent: :destroy

  end
