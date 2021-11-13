class AddSavedToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :saved, :boolean
  end
end
