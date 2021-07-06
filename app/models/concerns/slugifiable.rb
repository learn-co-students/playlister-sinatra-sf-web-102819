def slug(song_title)
    song_title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end

