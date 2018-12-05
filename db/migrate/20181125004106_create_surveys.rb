class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :token
      t.jsonb :result
      t.references :user, foreign_key: true
      t.references :template, foreign_key: {to_table: :survey_templates}

      t.timestamps
    end
  end
end
