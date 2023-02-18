class AddCountriesToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :countries, :text, array: true, default: []
  end
end
