class SongsController < ApplicationController

	def index
		@songs = Song.all
		p @songs

	end

	def create
		@song = Song.create(song_params)

		if @song.valid?
			p @song
			return redirect_to songs_path

		else
			flash[:errors] = @song.errors.full_messages

			return redirect_to :back
		end
	end 

	def show
		@song = Song.find(params[:id])
	end


	private
		def song_params
			params.require(:song).permit(:artist, :name).merge(user_id: session[:user_id])
		end
	end

