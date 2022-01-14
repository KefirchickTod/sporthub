class Article < ApplicationRecord

  # Relationship
  belongs_to :category, optional: true
  belongs_to :user, optional: true

  # Validate
  validates :title, presence: true, uniqueness: { scope: :title, massage: "For each article have to unique title" }
  validates :short_text, presence: true, length: { maximum: 255 }
  validates :full_text, presence: true

  # Singleton
  class << self

    # Get all published articles
    # @return [Array]
    def all_public
      Article.where("is_public = 1").to_a
    end

  end

end
