class Video < ApplicationRecord
    require 'net/http'
    require 'json'
    require 'bye-bug'
    binding.pry

    url = 'https://s3-eu-west-1.amazonaws.com/sofar-eu-1/video_data.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
end
