class AddFutureClassAndRecitalClassToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :future_class, :boolean, :default => false
    add_column :schedules, :recital_class, :boolean, :default => false
  end
end
