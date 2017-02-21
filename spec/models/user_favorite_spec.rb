require 'rails_helper'

RSpec.describe UserFavorite, type: :model do
  describe "User favorite validation" do
  	before do
  		@user_favorite = UserFavorite.create(user_id: 1, artist_id: "aabb1d9f-be12-45b3-a84d-a1fc3e8181fd", name:"Tiësto", img_large:"https://lastfm-img2.akamaized.net/i/u/174s/fdb7fa9617b20e9a06c323c57d2ed149.png", lastfm_url:"https://www.last.fm/music/Ti%C3%ABsto")
  	end

  	it 'can be created' do
      expect(@user_favorite).to be_valid
    end

  	it 'cannot be created without a user_id and name' do
  		@user_favorite.user_id = nil
  		@user_favorite.name = nil
  		expect(@user_favorite).to_not be_valid
  	end

    it 'cannot create duplicates' do
      @user_favorite = UserFavorite.create(user_id: 1, artist_id: "aabb1d9f-be12-45b3-a84d-a1fc3e8181fd", name:"Tiësto", img_large:"https://lastfm-img2.akamaized.net/i/u/174s/fdb7fa9617b20e9a06c323c57d2ed149.png", lastfm_url:"https://www.last.fm/music/Ti%C3%ABsto")      
      expect(@user_favorite).to_not be_valid
    end

  end
end