class AddContactedToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :contacted, :boolean
  end
end
