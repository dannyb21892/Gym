class Trainer < ApplicationRecord
  has_many :lessons
  has_many :users, through: :lessons

  def students
    self.lessons.map{|l| l.users.map{|u| u.name}}.flatten.uniq
  end

  def all_class_roster_size
    self.lessons.map{|l| l.users.map{|u| u.name}}.flatten.count
  end

  def self.sorted_popularity
    Trainer.all.map{|t| [t, t.all_class_roster_size]}.sort_by{|i| i[1]}.reverse!
  end

  def trainer_revenue
    total = 0
    self.users.each do |user|
      relevant_lessons = user.lessons.select{|l| l.trainer == self}
      total += (user.plan.price.to_f / user.lessons.count)*relevant_lessons.count
    end
    total
  end

end
