require_relative "../config/environment.rb"
#run db seed before testing
#may need to remove and readd db for equiVbalent testing

puts "#{Plan.types}" #[1, 2, 3]
puts "#{Plan.maximum.name}" #Gold
puts "#{Plan.first.next_level.name}" #Silver
puts "#{Plan.first.user_names}" #["Barry", "Farshad"]
puts "#{Plan.first.plan_revenue}" #58
puts "#{Plan.total_revenue}" #234
puts "#{Plan.first.revenue_forecast(5)}" #68
# puts "#{Plan.}" #

puts "#{User.first.eligible_for_more_lessons?}"  #false
puts "#{User.last.eligible_for_more_lessons?}"  #true
puts "#{User.last.enroll(Lesson.all.first)}"  #Enrollment made

puts "#{User.last.eligible_for_more_lessons?}"  #true
puts "enrolled? #{User.first.enrolled?(Lesson.first)}"  #true
puts "enrolled? #{User.first.enrolled?(Lesson.last)}"  #false

puts "unenroll_lesson: #{User.first.unenroll_lesson(Lesson.first)}"  #Enrollment
puts "check for above : enrolled? #{User.first.enrolled?(Lesson.first)}"  #false

puts "#{User.last.trainers}"  #["Kevin Levrone"]
puts "#{User.find(3).schedule}"  #["Monday 12:30pm", "Tuesday 6:30pm", "Wednesday 6:30am"]
puts "#{User.last.time_conflict?(Lesson.first)}" # true
puts "#{User.last.time_conflict?(Lesson.last)}"  #false

puts "upgrade_plan.name: #{User.first.upgrade_plan.name}"  #Silver
puts "downgrade_plan.name: #{User.first.downgrade_plan.name}"  #bronze
# puts "#{User.}"  #
puts "#{User.last.enroll(Lesson.all.first)}"  #Enrollment made
puts "#{User.last.enroll(Lesson.all.first)}"  #Enrollment made
puts "#{User.last.enroll(Lesson.all.first)}"  #Enrollment made
puts "#{User.find(3).enrollments.map {|e| e.lesson.name}}"
puts "#{User.find(3).lesson_names}"


puts "Lesson.most_popular:#{Lesson.most_popular.map {|l| l.name}}"
puts "unenroll_lesson: #{User.first.unenroll_lesson(Lesson.first)}"  #Enrollment
# puts "Lesson.most_popular:#{Lesson.most_popular.map {|l| l.name}}"
# puts "#{User.find(1).enroll(Lesson.all.first)}"  #Enrollment made

puts "#{Lesson.find_by(name: "Spin").users.count}"
puts "#{Lesson.find_by(name: "Stairway to Heaven").users.count}"
User.find(5).lessons << Lesson.find(2)
puts "Lesson.most_popular:#{Lesson.most_popular.map {|l| l.name}}"
# puts "#{Lesson.}"
# puts "Lesson"
user7 = User.create(name: "Pedroo", plan_id: 3).enroll(Lesson.find(3))
user8 = User.create(name: "Ivann", plan_id: 3).enroll(Lesson.find(3))
user9 = User.create(name: "Pedrooo", plan_id: 3).enroll(Lesson.find(3))
user10 = User.create(name: "Ivannn", plan_id: 3).enroll(Lesson.find(3))
puts "lesson full: #{Lesson.find(3).full?}"
puts "lesson full: #{Lesson.find(3).users.count}"


puts "trainer: students: #{Trainer.first.students}"
puts "trainer: students: #{Trainer.last.students}"

puts "trainer: class: #{Trainer.first.all_class_roster_size}"
