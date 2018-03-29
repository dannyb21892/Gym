#delete Gemfile.locl
#gem install faker from command line.
#bundle install
require 'faker'

plan1 = Plan.create(name: "Bronze", price: 29, level: 1, lesson_limit: 1)
plan2 = Plan.create(name: "Silver", price: 39, level: 2, lesson_limit: 2)
plan3 = Plan.create(name: "Gold", price: 49, level: 3, lesson_limit: 3)


trainer1 = Trainer.create(name: "Kevin Levrone")
trainer2 = Trainer.create(name: "Big Ramy")
trainer3 = Trainer.create(name: "Dave Pulombo")
trainer4 = Trainer.create(name: "Dennis Wolf")
trainer5 = Trainer.create(name: "Jay Cutler")
trainer6 = Trainer.create(name: "Kai Greene")
trainer7 = Trainer.create(name: "Iris Kyle")



lesson1 = Lesson.create(name: "Spin",               trainer: Trainer.find(1), duration: 30, capacity: 25, room: "BikeRoom",       time: "Monday 12:30pm")
lesson2 = Lesson.create(name: "Stairway to Heaven", trainer: Trainer.find(2), duration: 20, capacity: 10, room: "QuadRoom",       time: "Tuesday 6:30pm")
lesson3 = Lesson.create(name: "Beef Bicep",         trainer: Trainer.find(3), duration: 60, capacity: 15, room: "BuffRoom",       time: "Wednesday 6:30am")
lesson4 = Lesson.create(name: "Saiyan Chest",       trainer: Trainer.find(4), duration: 60, capacity: 15, room: "Power Room",     time: "Thursday 6:00pm")
lesson5 = Lesson.create(name: "Treadmill of Doom",  trainer: Trainer.find(5), duration: 30, capacity: 25, room: "Speed Room",     time: "Friday 5:00pm")
lesson6 = Lesson.create(name: "LeaveHumanityBehind",trainer: Trainer.find(6), duration: 60, capacity: 12, room: "Power Room",     time: "Saturday 6:am")
lesson7 = Lesson.create(name: "Calf farm",          trainer: Trainer.find(7), duration: 30, capacity: 19, room: "Leg AHOY room",  time: "Monday 2:30pm")
lesson8 = Lesson.create(name: "Power ParadICE",     trainer: Trainer.find(1), duration: 60, capacity: 22, room: "Power Room",     time: "Tuesday 3:30pm")
lesson9 = Lesson.create(name: "Forearm of Fury",    trainer: Trainer.find(2), duration: 30, capacity: 20, room: "Power Room",     time: "Wednesday 12:30pm")
lesson10 = Lesson.create(name: "Hellfire Heartpump",trainer: Trainer.find(3), duration: 30, capacity: 20, room: "BikeRoom",       time: "Thursday 4:00pm")
lesson11 = Lesson.create(name: "Deltoids or Die",   trainer: Trainer.find(4), duration: 30, capacity: 20, room: "Power Room",     time: "Friday 4:00pm")
lesson12 = Lesson.create(name: "Adamantium Abs",    trainer: Trainer.find(5), duration: 30, capacity: 20, room: "Power Room",     time: "Sunday 6:00am")




for i in 0..119
  user =User.create(name: Faker::Simpsons.character, plan_id: rand(1..3), username: "test#{i}", password: "test")
  # puts User.new(name: Faker::Simpsons.character, plan_id: rand(3))
  user.lessons << Lesson.find(rand(1..12))
end
# for i in 0..50
#   user =User.create(name: Faker::DragonBall.character, plan_id: rand(1..3))
#   # puts User.new(name: Faker::Simpsons.character, plan_id: rand(3))
#   user.lessons << Lesson.find(rand(1..9))
# end

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user1 = User.create(name: "Barry")
# user2 = User.create(name: "Mark")
# user3 = User.create(name: "Alejandro")
# user4 = User.create(name: "Farshad")
# user5 = User.create(name: "Pedro")
# user6 = User.create(name: "Ivan")

# user1.plan = plan1
# user2.plan = plan2
# user3.plan = plan3
# user4.plan = plan1
# user5.plan = plan2
# user6.plan = plan3
# lesson1.trainer = trainer1
# lesson2.trainer = trainer2
# lesson3.trainer = trainer3
# lesson4.trainer = trainer4
# lesson5.trainer = trainer5
# lesson6.trainer = trainer6
# lesson7.trainer = trainer7
# lesson8.trainer = trainer1
# lesson9.trainer = trainer2

#
# user1.lessons << lesson1
#
# user2.lessons << lesson1
# user2.lessons << lesson2
#
# user3.lessons << lesson1
# user3.lessons << lesson2
# user3.lessons << lesson3
#
#
# user1.save
# user2.save
# user3.save
# user4.save
# user5.save
# user6.save
# trainer1.save
# trainer2.save
# trainer3.save
# lesson1.save
# lesson2.save
# lesson3.save
