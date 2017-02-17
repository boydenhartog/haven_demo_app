class UserFavorite < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :name

  def self.fetch_favorites
  	favs = UserFavorite.group('name').order('count_id desc').count('id').take(5)
  	favs.map { |fav| [UserFavorite.find_by(name: fav[0]), fav[1]] }
  end
end
