class AddClasstypeIdToSchedules < ActiveRecord::Migration[4.2]
  def change
    add_column :schedules, :classtype_id, :integer
  end
end
