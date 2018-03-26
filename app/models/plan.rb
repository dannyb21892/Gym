class Plan < ApplicationRecord
  has_many :users

  def self.types
    self.all.map{|plan| plan.level}
  end

  def self.maximum
    Plan.find_by(level: self.types.max)
  end

  def next_level#(current_plan)
    self.level < self.class.maximum.level ? Plan.find_by(level: self.level + 1) : self.class.maximum
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
    (self.plan_revenue.to_f * ((self.price.to_f + price_increase.to_f)/self.price.to_f)).to_i
  end
end
