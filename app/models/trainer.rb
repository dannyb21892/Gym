class Trainer < ApplicationRecord
  has_many :lessons

  def students
    self.lessons{|l| l.users.map{|u| u.name}}.flatten.uniq
  end

  def all_class_roster_size
    self.lessons{|l| l.users.map{|u| u.name}}.flatten.count
  end

end
