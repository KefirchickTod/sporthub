class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|

      t.string :title, index: true

      t.integer :status, limit: 2, default: 0

      t.references :publish_in, index: true, foreign_keys: { to_table: :categories }
      t.references :languages, index: true, foreign_keys: true
      t.timestamps
    end
  end
end
