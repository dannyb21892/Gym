class Plan < ApplicationRecord
  has_many :users

  def self.types
    self.all.map{|plan| plan.level}
  end

  def self.maximum
    Plan.find_by(level: self.types.max)
  end

  def next_level(current_plan)
    current_plan.level < self.maximum.level ? Plan.find_by(level: current + 1) : self.maximum
  end

  def user_names
    self.users.map{|u| u.name}
  end

  def plan_revenue
    self.users.count * self.price
  end

  def self.total_revenue
    total = 0
    self.all.each {|plan| total += plan.plan_revenue}
    total
  end

  def revenue_forecast(price_increase)
    self.plan_revenue * ((self.price + price_increase)/self.price)
  end
end
