class FixColumnNameCompany < ActiveRecord::Migration[7.0]
  def change
    rename_column :companies, :decription, :description
  end
end
