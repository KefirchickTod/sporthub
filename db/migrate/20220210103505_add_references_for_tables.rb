class AddReferencesForTables < ActiveRecord::Migration[7.0]
  def change
    # Reference for articles
    add_reference :articles, :categories, index: true, foreign_key: true
    add_reference :articles, :users, index: true, foreign_key: true
    add_reference :articles, :teams, index: true, foreign_key: true
    add_reference :articles, :countries, index: true, foreign_key: true, comment: "Article location"

    # Reference for teams
    add_reference :teams, :sub_category, index: true, foreign_key: {to_table: :categories}
    add_reference :teams, :categories, index: true, foreign_key: true
    add_reference :teams, :countries, index: true, foreign_key: true
    add_reference :teams, :author, index: true, foreign_key: {to_table: :users}

    # Reference for social_networks
  end
end
