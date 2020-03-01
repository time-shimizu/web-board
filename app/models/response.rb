class Response < ApplicationRecord
  validates :user_name, presence: true
  validates :content,   presence: true
  belongs_to :topic

  def self.search(search)
    if search
      Response.where(['content LIKE ?', "%#{search}%"])
    else
      Response.all
    end
  end
end
