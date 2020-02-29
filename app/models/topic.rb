class Topic < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 400}
  validates :user_name, presence: true
  has_many :relationships
  has_many :subcategories, through: :relationships
  accepts_nested_attributes_for :relationships, allow_destroy: true
end
