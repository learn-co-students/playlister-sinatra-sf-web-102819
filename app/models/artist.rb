class Artist < ActiveRecord::Base
    has_many :songs
    has_many :song_genres, through: :songs
    has_many :genres, through: :song_genres

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
end