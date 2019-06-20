class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.text :house_number
      t.integer :user_id
      t.timestamps
    end
  end
end
