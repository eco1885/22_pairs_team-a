class RemoveUserFromResidences < ActiveRecord::Migration[5.0]
  def change
    remove_reference :residences, :user, foreign_key: true
  end
end
