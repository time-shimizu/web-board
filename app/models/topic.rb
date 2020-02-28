class Topic < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 400}
  validates :user_name, presence: true
end
