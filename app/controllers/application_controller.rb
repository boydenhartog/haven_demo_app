class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :get_favorites

  def get_favorites
  	@favorites = UserFavorite.fetch_favorites
  end
end
