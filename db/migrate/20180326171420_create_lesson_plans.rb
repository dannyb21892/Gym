class CreateLessonPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_plans do |t|
      t.integer :plan_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
