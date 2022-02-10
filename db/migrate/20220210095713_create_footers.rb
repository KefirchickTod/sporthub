class CreateFooters < ActiveRecord::Migration[7.0]
  def change
    create_table :footers do |t|

      t.string :title, index: true, unique: true

      t.boolean :show, default: true, comment: 'Hide/show'


      t.timestamps
    end
  end
end
