class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_favorites

  def has_favorite?(artist_id)
  	self.user_favorites.where(artist_id: artist_id).first
  end
end
