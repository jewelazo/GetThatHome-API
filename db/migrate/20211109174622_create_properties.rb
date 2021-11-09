class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.text :address
      t.string :property_type
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :area
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
