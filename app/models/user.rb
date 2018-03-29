class User < ApplicationRecord
  belongs_to :plan
  has_many :enrollments
  has_many :lessons, through: :enrollments
  has_secure_password
  validates :username, uniqueness: true
  validates :name, presence: true

  def eligible_for_more_lessons?
    self.lessons.count < self.plan.lesson_limit
  end

  def enroll(lesson)
    if self.eligible_for_more_lessons? && !lesson.full? && !self.time_conflict?(lesson)
      self.lessons << lesson
    end
  end

  def lesson_names
    self.lessons.map { |l| l.name}
  end


  def enrolled?(lesson)
    self.lessons.include?(lesson)
  end

  def unenroll(lesson)
    if self.enrolled?(lesson)
      Enrollment.find_by(user_id: self.id, lesson_id: lesson.id).destroy
    end
  end

  # def eligible_lessons
  #   self.plan.lessons
  # end

  def trainers
    self.lessons.map{|l| l.trainer.name}
  end

  def schedule
    self.lessons.map{|l| l.time}
  end

  def time_conflict?(lesson)
    self.schedule.include?(lesson.time)
  end

  def upgrade_plan
    if self.plan.level < Plan.maximum.level
      self.plan = plan.next_level
      self.save
    end
    self.plan
  end

  def downgrade_plan
    if self.plan.level > 1
      self.plan = Plan.find_by(level: (self.plan.level-1))
      self.save
    end
    self.plan
  end #downgrade_plan




end
