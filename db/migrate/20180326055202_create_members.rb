class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :group,foreign_key: true
      t.integer :before_user_id
      t.integer :after_user_id
      t.timestamps
    end
  end
end
