class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.integer :monthly_rent
      t.integer :maintenance
      t.boolean :pet

      t.timestamps
    end
  end
end
