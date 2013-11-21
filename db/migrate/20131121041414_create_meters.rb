class CreateMeters < ActiveRecord::Migration
  def change
    create_table :meters do |t|
      t.string :name, null: false
      t.decimal :latitude, precision: 9, scale: 6, null: false
      t.decimal :longitude, precision: 9, scale: 6, null: false

      t.timestamps
    end
  end
end
