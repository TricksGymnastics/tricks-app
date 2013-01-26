class AddClasstypeIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :classtype_id, :integer
  end
end
