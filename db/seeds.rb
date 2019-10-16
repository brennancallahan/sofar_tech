# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'pry'

url = 'https://s3-eu-west-1.amazonaws.com/sofar-eu-1/video_data.json'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data.each do |video|
    if video.present? && video["song"].present?
        video_uid = video["video_uid"].present? ? video["video_uid"] : "no uid"
        song_name = video["song"]["title"].present? ? video["song"]["title"].downcase : "no song name"
        artist_name = video["song"]["artist"].present? ? video["song"]["artist"]["title"].downcase : "no artist name"
        if video["song"]["city"].present? && video["song"]["city"]["title"] == "NYC"
            city = "new york city"
        elsif video["song"]["city"].present?
            city = video["song"]["city"]["title"].downcase
        else
            city = "no city"
        end
        Video.create!(video_uid: video_uid, song_name: song_name, artist_name: artist_name, city: city)
    end
end