class Lesson < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments
  belongs_to :trainer

  def self.most_popular
    popular = []
    count = 0
    self.all.each do |l|
      if l.users.count > count
        popular = []
        popular << l
        count = l.users.count
        # [popular]
      elsif l.users.count == count
        popular << l
      end
    end
    popular
  end

  def full?
    self.users.count >= self.capacity
    #used >= just in case of overbooking somehow
  end

  def name_date_trainer
    "#{self.name} on #{self.time.split(" ")[0]}s at #{self.time.split(" ")[1]} with #{self.trainer.name}"
  end
end
