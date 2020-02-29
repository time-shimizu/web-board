class Topic < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 400}
  validates :user_name, presence: true
  default_scope -> { order(created_at: :desc) }
  has_many :relationships
  has_many :subcategories, through: :relationships
  accepts_nested_attributes_for :relationships, allow_destroy: true
  has_many :responses

  def self.search(search)
      if search
        Topic.where(['title LIKE ?', "%#{search}%"])
      else
        Topic.all
      end
    end
end
