class CreateJoinTableForBannersAndLanguages < ActiveRecord::Migration[7.0]
  def change
    create_join_table :banners, :languages do |t|
      t.index [:banner_id, :language_id]
      t.index [:language_id, :banner_id]
    end
  end
end
