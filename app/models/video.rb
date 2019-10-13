class Video < ApplicationRecord
    # validates :video_uid, presence: true
    # validates :song_name, presence: true
    # validates :artist_name, presence: true
    # validates :city, presence: true
    def self.search(search)
        if search
            return where('city LIKE ?', "%#{search}")
        end
    else
        all
    end
end
