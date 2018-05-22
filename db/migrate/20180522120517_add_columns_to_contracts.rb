class AddColumnsToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :borough, :string
    add_column :contracts, :status, :string
    add_column :contracts, :interview_date, :string
  end
end
