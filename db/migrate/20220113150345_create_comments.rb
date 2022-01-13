class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|

      t.text :text, null: false, comment: "Comment content"
      t.integer :parent_id, comment: "Is comment sub?"

      # Relationship
      t.belongs_to :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
