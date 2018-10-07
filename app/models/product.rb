class Product < ApplicationRecord
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true
  validates :colour, presence: true
  validates :price, presence: true

  def self.search(search_term)
    Product.where("name ilike ?", "%#{search_term}%")
  end

  def highest_rating_comment
  comments.rating_desc.first
  end

  def average_rating
  comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}")
  end
   def viewed!
    $redis.incr("product:#{id}")
  end

end
