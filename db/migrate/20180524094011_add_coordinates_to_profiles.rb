class AddCoordinatesToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :latitude, :float
    add_column :profiles, :longitude, :float
    add_column :profiles, :address, :string
  end
end
