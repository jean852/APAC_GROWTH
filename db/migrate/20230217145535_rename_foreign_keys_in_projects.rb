class RenameForeignKeysInProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :client_id_id, :client_id
    rename_column :projects, :company_id_id, :company_id
    rename_column :projects, :expert_id_id, :expert_id
  end
end
