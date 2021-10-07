# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.delete_all
ArtworkShare.delete_all

alex = User.create!(
  id: 1,
  username: "Alex"
)

jeff = User.create(
  id: 2,
  username: "Jeff"
)

matt = User.create(
  id: 3,
  username: "Matt"
)

greg = User.create(
  id: 4,
  username: "Greg"
)

alex_2 = Artwork.create(
  id: 1,
  title: "Alex the great",
  img_url: "asdf",
  artist_id: alex.id
)

Artwork.create(
  id: 2,
  title: "asdf",
  img_url: "ggggg",
  artist_id: alex.id
)



jeff_2 = Artwork.create(
  id: 3,
  title: "jeff the avg",
  img_url: "gasdf",
  artist_id: jeff.id
)

matt_2 = Artwork.create(
  id: 4,
  title: "matt the frog",
  img_url: "dsfsa",
  artist_id: matt.id
)

greg_2 = Artwork.create(
  id: 5,
  title: "greg the bad",
  img_url: "asdfdsg",
  artist_id: greg.id
)

ArtworkShare.create(
  id: 1,
  artwork_id: alex.id,
  viewer_id:  alex_2.id
)

ArtworkShare.create(
  id: 2,
  artwork_id: jeff.id,
  viewer_id:  jeff_2.id
)

ArtworkShare.create(
  id: 3,
  artwork_id: matt.id,
  viewer_id:  matt_2.id
)

ArtworkShare.create(
  id: 4,
  artwork_id: greg.id,
  viewer_id: greg_2.id
)

ArtworkShare.create(
  id: 5,
  artwork_id: 2,
  viewer_id: alex.id
)