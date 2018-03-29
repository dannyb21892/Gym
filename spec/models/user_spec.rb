require 'rails_helper'

describe User do
  before(:each) do
    @plan = Plan.create(name: "Bronze", price: 29, level: 1, lesson_limit: 1)
    @plan2 = Plan.create(name: "Silver", price: 39, level: 2, lesson_limit: 2)
    @plan3 = Plan.create(name: "Gold", price: 49, level: 3, lesson_limit: 3)
    @user = User.create(name: "Arnold S", username: "arnolds", password: "arnoldpassword", plan_id: @plan.id)
    @user2 = User.create(name: "Mike O'hearn", username: "doggolover", password: "allnatural", plan_id: @plan2.id)
    @user_bad = User.create(username: "arnolds", password: "arnoldpassword", plan_id: @plan.id)
    @user_bad2 = User.create(name: "Jerry Seinfield", password: "arnoldpassword", plan_id: @plan.id)
    @user_bad3 = User.create(name: "Jerry Seinfield", username:"arnolds", password: "arnoldpassword", plan_id: @plan.id)

    @trainer1 = Trainer.create(name: "Kevin Levrone")
    @trainer2 = Trainer.create(name: "Big Ramy")
    @trainer3 = Trainer.create(name: "Dave Pulombo")

    @lesson1 = Lesson.create(name: "Spin",               trainer: @trainer1, duration: 30, capacity: 25, room: "BikeRoom",       time: "Monday 12:30pm")
    @lesson2 = Lesson.create(name: "Stairway to Heaven", trainer: @trainer2, duration: 20, capacity: 10, room: "QuadRoom",       time: "Tuesday 6:30pm")
    @lesson3 = Lesson.create(name: "Beef Bicep",         trainer: @trainer3, duration: 60, capacity: 15, room: "BuffRoom",       time: "Tuesday 6:30pm")

  end #before
  it "can be created" do
    expect(@user).to be_valid
  end #it

  it "requires a name" do
    expect(@user_bad).to be_invalid
  end

  it "requires a username" do
    expect(@user_bad2).to be_invalid
  end #it

  it "requires a username to be unique" do
    expect(@user_bad3).to be_invalid
  end #it

  it "can accept lessons" do
    @user.enroll @lesson1
    expect(@user.lessons.count).to eq(1)
  end #it

  it "can only accepts lessons that are within plan limit" do
    @user.enroll @lesson1
    @user.enroll @lesson2
    expect(@user.lessons.count).to eq(1)
  end #it

  it "can only accept lessons that don't conflict with existing lessons" do
    @user2.enroll @lesson2
    @user2.enroll @lesson3
    expect(@user2.lessons.count).to eq(1)
  end #it

  # it "can upgrade plan unless plan is plan at highest level" do
  #   @user.upgrade_plan
  #   expect(@user.plan.name).to eq("Silver")
  #   @user.upgrade_plan
  #   expect(@user.plan).to eq(Plan.maximum)
  # end #it
  it "can upgrade plan unless plan is plan at highest level" do
    Plan.types.each do |type|
      plan = Plan.find_by(level: type)
      if plan.level == Plan.maximum.level
        @user.upgrade_plan
        expect(@user.plan.name).to eq(Plan.maximum.name)
      else
        @user.upgrade_plan
        expect(@user.plan.name).to eq(plan.next_level.name)
      end
    end
  end #it
  #
  it "can downgrade plan" do
    @user2.downgrade_plan
    expect(@user.plan.name).to eq("Bronze")
  end #it

end #describe
