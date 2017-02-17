class UserFavoritesController < ApplicationController
	def create
	  @user_favorite = current_user.user_favorites.new(user_favorite_params)
	  if @user_favorite.save
	  	redirect_to :back, notice: "Added artist to favorites!"
	  else
	  	redirect_to :back, notice: "This artist is already marked as favorite"
	  end
	end

	def destroy
		if UserFavorite.find_by_id(params[:id]).destroy
			redirect_to :back, notice: "Removed artist from favorites!"
		else
	  	redirect_to :back, notice: "This artist is already removed as favorite"
	  end			
	end

	private
	def user_favorite_params
		params.permit(:artist_id, :user_id, :id, :img_large, :lastfm_url, :name)
	end
end