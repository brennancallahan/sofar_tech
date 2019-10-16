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
        video_uid = video["video_uid"].present? ? video["video_uid"] : "No UID"
        song_name = video["song"]["title"].present? ? video["song"]["title"] : "No Song Name"
        artist_name = video["song"]["artist"].present? ? video["song"]["artist"]["title"] : "No Artist Name"
        city = video["song"]["city"].present? ? video["song"]["city"]["title"] : "No City"
        Video.create!(video_uid: video_uid, song_name: song_name, artist_name: artist_name, city: city)
    end
end