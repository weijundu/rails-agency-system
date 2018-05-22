class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :start_date
      t.string :end_date
      t.string :note
      t.references :profile, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
