class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.references :client_id, foreign_key: { to_table: :users }
      t.references :company_id, foreign_key: { to_table: :companies }
      t.references :expert_id, foreign_key: { to_table: :users }
      t.string :project_status
      t.string :project_type
      t.date :bidding_start
      t.date :bidding_end
      t.string :rfp_status
      t.date :project_start
      t.date :project_end
      t.integer :project_budget
      t.integer :project_price
      t.timestamps
    end
  end
end
