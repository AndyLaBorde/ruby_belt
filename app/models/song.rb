class Song < ActiveRecord::Base
	
	has_many :playlists
	has_many :users, through: :playlists, source: :user

	validates :artist, :name, presence: true
end
