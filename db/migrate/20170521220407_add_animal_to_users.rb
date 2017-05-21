class AddAnimalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :animal, :string
  end
end
