# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create(
  birth_date: Date.new(2003,2,3),
  colors: "red",
  name: "Steve",
  sex: "M"
  
)

Cat.create(
  birth_date: Date.new(2010,5,12),
  colors: "green",
  name: "Tina",
  sex: "F"
  
)

Cat.create(
  birth_date: Date.new(2012,6,30),
  colors: "blue",
  name: "Mittens",
  sex: "M"
  
)

Cat.create(
  birth_date: Date.new(2017,4,28),
  colors: "violet",
  name: "Kibble",
  sex:  "F"
  
)

Cat.create(
  birth_date:Date.new(2019,4,11),
  colors: "orange",
  name: "Bacon",
  sex: "M"
  
)