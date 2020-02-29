class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :relationships
  has_many :topics, through: :relationships
end
