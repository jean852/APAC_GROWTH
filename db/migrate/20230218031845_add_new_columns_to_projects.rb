class AddNewColumnsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :project_duration, :integer
    add_column :projects, :project_objective, :string
    add_column :projects, :intros_quantity, :integer
    add_column :projects, :intros_type, :text, array: true, default: []
    add_column :projects, :target_industries, :text, array: true, default: []
    add_column :projects, :target_regions, :text, array: true, default: []
    add_column :projects, :target_type, :string
    add_column :projects, :target_size, :text, array: true, default: []
    add_column :projects, :target_company, :string
    add_column :projects, :target_url, :string
    add_column :projects, :target_country, :string
    add_column :projects, :target_name, :string
    add_column :projects, :target_ideal, :text
    add_column :projects, :target_seniority, :text, array: true, default: []
    add_column :projects, :target_jobtitle, :text, array: true, default: []
    add_column :projects, :study_elements, :text, array: true, default: []
    add_column :projects, :study_deliverables, :text, array: true, default: []
    add_column :projects, :project_expert_fee, :integer
    add_column :projects, :project_platform_fee, :integer
    add_column :projects, :project_payment_fee, :integer
    add_column :projects, :parameter_incognito, :boolean
    add_column :projects, :parameter_terms, :boolean
  end
end
