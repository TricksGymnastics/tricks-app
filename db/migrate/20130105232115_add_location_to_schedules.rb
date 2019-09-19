class AddLocationToSchedules < ActiveRecord::Migration[4.2]
  def change
    add_column :schedules, :location, :string

  end
end
