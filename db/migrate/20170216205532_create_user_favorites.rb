class CreateUserFavorites < ActiveRecord::Migration
  def change
    create_table :user_favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.string :artist_id

      t.timestamps null: false
    end
    add_index :user_favorites, :artist_id
  end
end
