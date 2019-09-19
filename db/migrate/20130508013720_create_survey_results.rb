class CreateSurveyResults < ActiveRecord::Migration[4.2]
  def change
    create_table :survey_results do |t|
      t.text :result
      t.integer :survey_id

      t.timestamps
    end
  end
end
