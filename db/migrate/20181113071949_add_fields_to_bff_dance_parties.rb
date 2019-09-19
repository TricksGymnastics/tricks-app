class AddFieldsToBffDanceParties < ActiveRecord::Migration[4.2]
  def change
    add_column :bff_dance_parties, :granite_bay_start_time, :time
    add_column :bff_dance_parties, :granite_bay_duration, :integer
    add_column :bff_dance_parties, :folsom_start_time, :time
    add_column :bff_dance_parties, :folsom_duration, :integer
    add_column :bff_dance_parties, :sacramento_start_time, :time
    add_column :bff_dance_parties, :sacramento_duration, :integer
    add_column :bff_dance_parties, :image, :string
  end
end
