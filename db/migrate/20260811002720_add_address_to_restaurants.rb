class AddAddressToRestaurants < ActiveRecord::Migration[8.1]
  def change
    # add_column :table, :column, :type, default: value
    add_column :restaurants, :address, :string
    # remove_column :restaurants, :address, :string
    # rename_column :restaurants, :address, :string
    # add_reference :restaurants, :user, foreign_key: true
  end
end
