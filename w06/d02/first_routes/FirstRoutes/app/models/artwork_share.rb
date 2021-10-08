class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: { scope: :viewer_id}
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

   belongs_to :art_piece,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

end
