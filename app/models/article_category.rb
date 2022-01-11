class ArticleCategory < ApplicationRecord

  # Validate block
  validates :title, presence: true, uniqueness: true



end
