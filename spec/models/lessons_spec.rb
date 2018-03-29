require 'rails_helper'

describe Lesson do
  before(:each) do

    @plan = Plan.create(name: "Silver", price: 39, level: 2, lesson_limit: 2)
    @user = User.create(name: "Arnold S", username: "arnolds", password: "arnoldpassword", plan_id: @plan.id)

    @trainer1 = Trainer.create(name: "Kevin Levrone")
    @trainer2 = Trainer.create(name: "Big Ramy")
    @trainer3 = Trainer.create(name: "Dave Pulombo")

    @lesson1 = Lesson.create(name: "Spin",               trainer: @trainer1, duration: 30, capacity: 1, room: "BikeRoom",       time: "Monday 12:30pm")
    @lesson2 = Lesson.create(name: "Stairway to Heaven", trainer: @trainer2, duration: 20, capacity: 10, room: "QuadRoom",       time: "Tuesday 6:30pm")
    @lesson3 = Lesson.create(name: "Beef Bicep",         trainer: @trainer3, duration: 60, capacity: 0, room: "BuffRoom",       time: "Tuesday 6:30pm")
  end

  it "knows if it is full or open" do
    expect(@lesson1.full?).to be(false)
    @user.enroll(@lesson1)
    expect(@lesson1.full?).to be(true)
    expect(@lesson3.full?).to be(true)
  end
  # it "" do
  #
  # end

end
