class CreatePlates < ActiveRecord::Migration[5.2]
  def change
    create_table :plates do |t|
      t.string :number
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
