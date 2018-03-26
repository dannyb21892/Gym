class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.integer :lesson_limit

      t.timestamps
    end
  end
end
