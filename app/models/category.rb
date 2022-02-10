class Category < ApplicationRecord
  before_destroy :delete_articles

  # Validates
  validates :title, uniqueness: {scope: :title, massage: "Category title hos to get unique key"}

  # Relations
  has_many :articles, primary_key: "categories_id", foreign_key: "id", dependent: :destroy
  has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  has_many :teams, primary_key: "categories_id", foreign_key: "id", dependent: :destroy

  belongs_to :parent, class_name: "Category", optional: true

  # Get all sub categories for current category
  #   all_sub_categories # get array of hash
  #   # @example:
  #   # [
  #   #   {
  #   #      :id => 5,
  #   #      :title => 'Title'
  #   #      :children => [
  #   #        :id => 3,
  #   #        :title => 'TEst'
  #   #        ...etc
  #   #      ]
  #   #    }
  #   #  ]
  # @return[Array]
  def all_sub_categories
    return [] if children.empty?

    children.map do |category|
      {
        id: category.id,
        title: category.title,
        children: category.all_sub_categories
      }
    end
  end

  private

  # Before delete category we need delete all connected articles
  # And remove all sub categories
  def delete_articles
    @articles.each do |article|
      article.delete
    end
    @children.each do |category|
      category.remove
    end
  end

  class << self
    # Select all main categories
    def all_main
      Category.where("parent_id IS NULL")
    end
  end
end
