class CreateSurveysTakens < ActiveRecord::Migration
  def change
    create_table :surveys_takens do |t|

      t.timestamps
    end
  end
end
