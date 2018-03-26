# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: "Barry")
user2 = User.create(name: "Mark")
user3 = User.create(name: "Alejandro")
user4 = User.create(name: "Farshad")
user5 = User.create(name: "Pedro")
user6 = User.create(name: "Ivan")

plan1 = Plan.create(name: "Bronze", price: 29)
plan2 = Plan.create(name: "Silver", price: 39)
plan3 = Plan.create(name: "Gold", price: 49)

user1.plan = plan1
user2.plan = plan2
user3.plan = plan3
user4.plan = plan1
user5.plan = plan2
user6.plan = plan3


lesson1 = Lesson.create(name: "Spin", duration: 30, capacity: 25, room: "BikeRoom", time: "Monday 12:30pm")
lesson2 = Lesson.create(name: "Stairway to Heaven", duration: 20, capacity: 10, room: "QuadRoom", time: "Tuesday 6:30pm")
lesson3 = Lesson.create(name: "Beef Bicep", duration: 60, capacity: 5, room: "BuffRoom", time: "Wednesday 6:30am")

trainer1 = Trainer.create(name: "Kevin Levrone")
trainer2 = Trainer.create(name: "Big Ramy")
trainer3 = Trainer.create(name: "Dave Pulombo")

lesson1.trainer = trainer1
lesson2.trainer = trainer2
lesson3.trainer = trainer3

plan1.lessons << lesson1

plan2.lessons << lesson1
plan2.lessons << lesson2

plan3.lessons << lesson1
plan3.lessons << lesson2
plan3.lessons << lesson3
