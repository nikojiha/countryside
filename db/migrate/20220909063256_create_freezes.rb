class CreateFreezes < ActiveRecord::Migration[6.1]
  def change
    create_table :freezes do |t|
      t.references :customer

      t.timestamps
    end
  end
end
