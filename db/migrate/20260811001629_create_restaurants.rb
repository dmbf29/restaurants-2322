class CreateRestaurants < ActiveRecord::Migration[8.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :rating # , default: 0

      t.timestamps
    end
  end
end
