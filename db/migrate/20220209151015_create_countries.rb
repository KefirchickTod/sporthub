class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|

      t.string :title, index: true, unique: true, comment: 'Country name'

      t.timestamps
    end
  end
end
