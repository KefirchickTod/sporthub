class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false, index: {unique: true, name: "categories_title"}, comment: "Main title of category"
      t.integer :parent_id, null: true, comment: "Parent id of category"

      t.timestamps
    end
  end
end
