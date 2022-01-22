# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(email: 'test@test.com', password: '123456' )

12.times do |el|
  CuriosityCard.create(title: 'Hello world',
                       content: "this is my curiosity No.#{el}",
                       user_id: User.first.id)
end

CuriosityCard.create(title: 'Prueba de embarazo en el antiguo Egipto',
                     content: "Para saber si una mujer estaba embarazada"\
                     " debía orinar en dos bolsitas: una contenía cebada y "\
                     "la otra trigo, si germinaba primero la cebada "\
                     "entonces sería un niño, por el contrarío brotaba primero"\
                     "el trigo sería niña"
                     user_id: User.first.id)
