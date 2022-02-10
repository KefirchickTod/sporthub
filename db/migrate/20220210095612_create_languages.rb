class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|

      t.string :title, index: true

      t.boolean :status, comment: 'Switch off/on'

      #t.timestamps
    end
  end
end
