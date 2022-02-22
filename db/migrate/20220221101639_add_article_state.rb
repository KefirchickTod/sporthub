class AddArticleState < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :aasm_state, :string
  end
end
