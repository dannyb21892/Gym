class AddLevelToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :level, :integer
  end
end
