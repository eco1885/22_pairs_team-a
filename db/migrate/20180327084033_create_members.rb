class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.integer :user_id, null: false
      t.integer :community_id, null: false

      t.timestamps
    end
  end
end
