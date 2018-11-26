class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, index: true
      t.integer :topic_id, index: true
      t.index  :user_id, name:index_favorites_on_user_id
      t.index :topic_id, name:index_favorites_on_topic_id

      t.timestamps
    end
  end
end
