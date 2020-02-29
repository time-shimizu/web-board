class Relationship < ApplicationRecord
  belongs_to :topic
  belongs_to :subcategory
end
