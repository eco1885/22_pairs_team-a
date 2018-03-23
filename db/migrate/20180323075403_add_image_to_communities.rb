class AddImageToCommunities < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :image, :string, null:false
  end
end
