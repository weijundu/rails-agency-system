class AddColumnToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :start, :date
    add_column :contracts, :finished, :date
  end
end
