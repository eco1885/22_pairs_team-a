class AddResidenceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :Residence, foreign_key: true
  end
end
