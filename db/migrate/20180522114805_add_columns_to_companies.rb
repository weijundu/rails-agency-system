class AddColumnsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :address, :string
    add_column :companies, :phone_number, :string
end
end
