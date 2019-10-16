class Video < ApplicationRecord
    # validates :video_uid, presence: true
    # validates :song_name, presence: true
    # validates :artist_name, presence: true
    # validates :city, presence: true
    def self.search(search)
        if search
            key = search.downcase
            return where('city LIKE ? or song_name LIKE ? or artist_name LIKE ?', "%#{key}%", "%#{key}%", "%#{key}%" )
        else
            all
        end
    end
end
