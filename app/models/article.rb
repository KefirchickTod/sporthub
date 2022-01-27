class Article < ApplicationRecord
  # Virtus
  # include Virtus.model

  attribute :title, :string
  attribute :full_text, :string
  attribute :short_text, :string
  attribute :default_photo, :string
  attribute :is_public, :integer, default: 1

  # Relationship
  belongs_to :category, foreign_key: "categories_id", primary_key: "id", optional: true # Why?
  belongs_to :user, foreign_key: "users_id", primary_key: "id", optional: true

  # Validate
  validates :title, presence: true, uniqueness: {scope: :title, massage: "For each article have to unique title"}
  validates :short_text, presence: true, length: {maximum: 255}
  validates :full_text, presence: true
  validates :users_id, presence: true
  validates :categories_id, presence: true

  # Singleton
  class << self
    # Get all published articles
    # @return [Array]
    def all_public
      Article.where("is_public = 1").to_a
    end
  end
end
