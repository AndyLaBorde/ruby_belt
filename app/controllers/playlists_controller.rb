class PlaylistsController < ApplicationController

	def create
		@playlist = Playlist.create(playlist_params)

		if @playlist.valid?
			return redirect_to songs_path
		end

		flash[:errors] = @playlist.errors.full_message

		return redirect_to :back

	end

	def show
		
	end

	private
		def playlist_params
			params.require(:playlist).permit(:song_id).merge(user_id: session[:user_id])
		end
end
	