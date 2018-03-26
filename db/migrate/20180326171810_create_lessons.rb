class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.integer :trainer_id
      t.integer :duration
      t.string :name
      t.integer :capacity
      t.string :time
      t.string :room

      t.timestamps
    end
  end
end
