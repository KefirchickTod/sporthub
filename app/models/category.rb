class Category < ApplicationRecord
  # Validates
  validates :title, uniqueness: {scope: :title, massage: "Category title hos to get unique key"}

  # Relations
  has_many :articles, primary_key: "categories_id", foreign_key: "id"
end
