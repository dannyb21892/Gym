class Lesson < ApplicationRecord
  has_many :lesson_plans
  has_many :plans, through: :lesson_plans
  belongs_to :trainer
  
end
