class Response < ApplicationRecord
  validates :user_name, presence: true
  validates :content,   presence: true
  belongs_to :topic
end
