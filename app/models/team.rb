class Team < ApplicationRecord
  # has_many :user_teams, foreign_key: "teams_id", primary_key: "id"

  belongs_to :category, foreign_key: "categories_id", primary_key: "id"
  belongs_to :country, foreign_key: "countries_id", primary_key: "id"
  belongs_to :sub_category, class_name: "Category", foreign_key: "categories_id", primary_key: "id"
  # has_many :articles, primary_key: "articles_id", foreign_key: "id", dependent: :destroy
  has_and_belongs_to_many :users

  has_one_attached :image, dependent: :destroy
end
