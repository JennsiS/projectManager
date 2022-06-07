class CreateProjectsPhases < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_phases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :phase, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.string :role_user

      t.timestamps
    end
  end
end
