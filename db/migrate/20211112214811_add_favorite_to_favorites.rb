class AddFavoriteToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :favorite, :boolean
  end
end
