class CreateSurveyTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_templates do |t|
      t.string :name
      t.text :description
      t.jsonb :data

      t.timestamps
    end
  end
end
