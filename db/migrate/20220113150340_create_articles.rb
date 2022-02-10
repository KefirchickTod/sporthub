class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, index: { unique: true, name: "article_title" }

      t.text :content, comment: "Article content"
      t.string :caption, index: true

      t.boolean :show_comment, default: true
      t.boolean :is_public, default: true, comment: "Check if public"

      t.timestamps

      # Relationship
      #t.references :categories, index: true, foreign_key: true
      #t.references :users, index: true, foreign_key: true
      #t.references :teams, index: true, foreign_key: true
      #t.references :countries, index: true, foreign_key: true, comment: "Article location"

    end
  end
end
