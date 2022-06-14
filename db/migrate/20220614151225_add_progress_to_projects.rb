class AddProgressToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :progress, :string
  end
end
