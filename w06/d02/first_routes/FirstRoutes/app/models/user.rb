class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
 
  has_many :artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artworks

  has_many :shared_art,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :art_shared,
    through: :shared_art,
    source: :art_piece
end
