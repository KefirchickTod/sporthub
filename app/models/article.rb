class Article < ApplicationRecord
  # TODO(subscribes): If user subscribes to team current articles and current article changing status(state) to published, create mail to user

  # Virtus
  # include Virtus.model
  attribute :title, :string
  attribute :caption, :string
  attribute :content, :string
  attribute :is_public, :boolean, default: true
  attribute :show_comment, :boolean, default: true

  # Relationship
  belongs_to :category, foreign_key: "categories_id", primary_key: "id", optional: true # Why?
  belongs_to :user, foreign_key: "users_id", primary_key: "id", optional: true
  belongs_to :country, foreign_key: "countries_id", primary_key: "id", optional: true
  belongs_to :team, foreign_key: "teams_id", primary_key: "id", optional: true
  # belongs_to :country, foreign_key: "country"
  has_one_attached :image, dependent: :destroy

  # Validate
  validates :title, presence: true, uniqueness: {scope: :title, massage: "For each article have to unique title"}
  validates :content, presence: true
  validates :users_id, presence: true
  validates :categories_id, presence: true

  scope :all_public, -> { where("is_public = 1") }

  # state_machine :is_public, initial: :published do
  #  event :published do
  #    # Todo send email
  #  end
  # end

  # Singleton
  class << self
    def most_popular
      # todo: Search most popular articles
    end

    def most_commented
      # todo: Search most commented articles
    end

    def best_of_day
      # todo: Search article from current day and get best photo
    end
  end

  def long_created_at
    # l created_at, format: :long
  end
end
