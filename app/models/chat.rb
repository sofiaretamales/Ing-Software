class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user

  validates :user, presence: true
  validates :admin_user, presence: true
  validates :message, presence: true

end
