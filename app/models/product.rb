class Product < ApplicationRecord

  def self.search(search_term)
    Product.where("name ilike ?", "%#{search_term}%")
  end

end
