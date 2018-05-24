class AddImageToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :image, :string
    add_column :companies, :image, :string
  end
end
