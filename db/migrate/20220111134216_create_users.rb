class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|

      t.string :email, null: false, index: { unique: true }, comment: "User email and login"
      t.string :password_digest, null: false

      t.string :first_name, null: false
      t.string :second_name

      t.timestamps
    end
  end
end
