class CreateArticleCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :article_categories do |t|
      t.string :title, null: false, index: { unique: true }, comment: "Main title of category"
      t.integer :parent_id, null: true, comment: "Parent id of category"

      t.timestamps
    end
  end
end
