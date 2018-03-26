class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
      t.integer :status, null: false
      t.string :content
      t.references :user, foreign: true

      t.timestamps
    end
  end
end
