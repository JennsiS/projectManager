class CreateImportantDates < ActiveRecord::Migration[7.0]
  def change
    create_table :important_dates do |t|
      t.date :date
      t.string :description
      t.string :name
      t.references :project
      t.timestamps
    end
  end
end
