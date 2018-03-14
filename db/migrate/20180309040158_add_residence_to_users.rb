class AddResidenceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :residence, :string
  end
end
