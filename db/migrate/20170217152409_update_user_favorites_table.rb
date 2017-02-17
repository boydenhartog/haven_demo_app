class UpdateUserFavoritesTable < ActiveRecord::Migration
  def change
	add_column :user_favorites, :name, :string
	add_column :user_favorites, :img_large, :string
	add_column :user_favorites, :lastfm_url, :string
  end
end
