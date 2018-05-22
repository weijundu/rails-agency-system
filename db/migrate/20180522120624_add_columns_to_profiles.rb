class AddColumnsToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :trade, :string
    add_column :profiles, :skills, :string
    add_column :profiles, :borough, :string
    remove_column :profiles, :name, :string

  end
end
