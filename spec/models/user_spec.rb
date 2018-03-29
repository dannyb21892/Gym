require 'rails_helper'
# require_relative '../a.rb'  #loads the code from our actual program file

describe User do
  before(:each) do
    @plan = Plan.create(name: "Bronze", price: 29, level: 1, lesson_limit: 1)
    @user = User.create(name: "Arnold S", username: "arnolds", password: "arnoldpassword", plan_id: @plan.id)
    @user_bad = User.create(username: "arnolds", password: "arnoldpassword", plan_id: @plan.id)
    @user_bad2 = User.create(name: "Jerry Seinfield", password: "arnoldpassword", plan_id: @plan.id)
    @user_bad3 = User.create(name: "Jerry Seinfield", username:"arnolds", password: "arnoldpassword", plan_id: @plan.id)
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

  # it "" do
  #   expect
  # end #it
end #describe

#
# describe "something" do     #we use the describe RSpec method and strings to describe what we are testing.
#                 This code is entirely for you, the programmer, and has very little meaning to RSpec or Ruby.
# it "returns something" do   #to state an expectation or behavior of that method.
#     "" is only there to provide you, the programmer, with a description of what behavior we're currently testing.
#     #what is inside the "it do end" block is what we actually test
# expect(age_of_person).to eq(19)   #expect var to equal value
# Stubbing        refers to the fake implementation of a method.

#
# require 'rails_helper'
#
# describe Student do
#   before(:each) do
#     @student = Student.create!(first_name: "Daenerys", last_name: "Targaryen")
#   end
#
#   it 'can be created' do
#     expect(@student).to be_valid
#   end
#
# end
