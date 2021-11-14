class AddPropertiableToProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :propertiable, polymorphic: true, null: false
  end
end
