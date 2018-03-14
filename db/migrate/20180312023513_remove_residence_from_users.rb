class RemoveResidenceFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :residence, :text
  end
end
