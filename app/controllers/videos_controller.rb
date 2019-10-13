class VideosController < ApplicationController
    def index
        @videos = Video.search(params[:search])
        binding.pry
    end

    private

    def video_params
        params.require(:video).permit(:song_name, :artist, :city, :search)
    end
end
