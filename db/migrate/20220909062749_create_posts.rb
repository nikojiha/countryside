class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.integer :tag_id, null: false
      t.string :post_comment
      t.string :location
      t.float :star, null: false, default: 0
      

      t.timestamps
    end
  end
end
