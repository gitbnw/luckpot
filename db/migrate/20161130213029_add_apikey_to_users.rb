class AddApikeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :api_key, :string
  end
end
