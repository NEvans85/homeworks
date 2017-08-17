class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    results = {}
    track_counts = albums
                   .select(:title, "COUNT(*) AS track_count")
                   .joins(:tracks)
                   .group('albums.title')
                   .order('track_count DESC')
    track_counts.each do |t_count|
      results[t_count.title] = t_count.track_count
    end
    results
  end
end
