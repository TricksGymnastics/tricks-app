class AddFutureClassAndRecitalClassToSchedules < ActiveRecord::Migration[4.2]
  def change
    add_column :schedules, :future_class, :boolean, :default => false
    add_column :schedules, :recital_class, :boolean, :default => false
  end
end
