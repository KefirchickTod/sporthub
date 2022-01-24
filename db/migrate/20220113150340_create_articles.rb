class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, index: {unique: true, name: "article_title"}

      t.text :full_text, comment: "Main content of articles"
      t.string :short_text, comment: "Short content of articles"
      t.string :default_photo, comment: "Main photo in site and seo output"

      t.integer :is_public, default: 1, limit: 2, comment: "Check if public"

      t.timestamps

      # Relationship
      t.references :categories, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true
    end
  end
end
