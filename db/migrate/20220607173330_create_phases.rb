class CreatePhases < ActiveRecord::Migration[7.0]
  def change
    create_table :phases do |t|
      t.date :start_date
      t.date :finish_date
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
