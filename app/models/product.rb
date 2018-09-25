class Product < ApplicationRecord
  has_many :comments

  def self.search(search_term)
    Product.where("name ilike ?", "%#{search_term}%")
  end

  def highest_rating_comment
  comments.rating_desc.first
  end

end
