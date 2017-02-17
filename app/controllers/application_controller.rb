class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :get_favorites

  def get_favorites
  	#@favorites = UserFavorite.all.group_by(&:name).sort_by { |name, collection| collection.size }.to_h
  	@favorites = UserFavorite.fetch_favorites
  	#@favorites = UserFavorite.group('name').order('count_id desc').count('id').take(4)
  end
end
