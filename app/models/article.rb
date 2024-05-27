class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }, uniqueness: true
  validates :content, presence: true

  def self.search(query)
    if query.present?
      where('title ILIKE ? OR content ILIKE ?', "%#{query}%", "%#{query}%")
    else
      all
    end
  end
end
