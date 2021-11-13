class AddClosedToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :closed, :boolean
  end
end
