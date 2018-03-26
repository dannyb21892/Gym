class User < ApplicationRecord
  belongs_to :plan
  has_many :enrollments
  has_many :lessons, through: :enrollments

  def eligible_for_more_lessons?
    self.lessons.count < self.plan.lesson_limit
  end

  def enroll(lesson)
    if self.eligible_for_more_lessons? && !lesson.full? && !self.time_conflict?(lesson)
      Enrollment.create(user_id: self.id, lesson_id: lesson.id)
      #Creates join object between user and lesson
    end
  end

  def enrolled?(lesson)
    self.lessons.include?(lesson)
  end

  def unenroll_lesson(lesson)
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
    if self.plan.level < Plan.maximum
      self.plan = plan.next_level
      self.save
    end
  end

  def trainers
    self.lessons.map{|l| l.trainer.name}
  end




end
