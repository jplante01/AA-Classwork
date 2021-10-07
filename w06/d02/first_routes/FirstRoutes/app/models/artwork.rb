class Artwork < ApplicationRecord
  validates :artist_id, uniqueness: { scope: :title}
  validates :img_url, presence: true, uniqueness: true
  validates :artist_id, presence: true
  validates :title, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User
    
   has_many :shared_artworks,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

    has_many :shared_viewers,
      through: :shared_artworks,
      source: :viewer
end
