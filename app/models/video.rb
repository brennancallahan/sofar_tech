class Video < ApplicationRecord
    # validates :video_uid, presence: true
    # validates :song_name, presence: true
    # validates :artist_name, presence: true
    # validates :city, presence: true
    def self.search(search)
        if search
            return where('city LIKE ? or song_name LIKE ? or artist_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" ).distinct
        else
            all
        end
    end
end
