class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :topics, through: :relationships
  has_many :relationships
end
