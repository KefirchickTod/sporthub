class AddCofirmationColumnToUser < ActiveRecord::Migration[7.0]
  def change
    # add_column :users, :confirmed_at, :datetime
    add_column :users, :reset_password_sent_at, :datetime
  end
end