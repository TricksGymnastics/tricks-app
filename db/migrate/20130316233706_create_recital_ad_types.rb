class CreateRecitalAdTypes < ActiveRecord::Migration
  def change
    create_table :recital_ad_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
