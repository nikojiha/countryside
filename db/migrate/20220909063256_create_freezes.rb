class CreateFreezes < ActiveRecord::Migration[6.1]
  def change
    create_table :freezes do |t|

      t.timestamps
    end
  end
end
