class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|

      t.text :text, null: false, comment: "Comment content"
      t.integer :parent_id, comment: "Is comment sub?"

      t.timestamps

      # Relationship
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

    end
  end
end
