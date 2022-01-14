class Category < ApplicationRecord

  # Validates
  validates :title, uniqueness: {scope: :title, massage: "Category title hos to get unique key"}
end
