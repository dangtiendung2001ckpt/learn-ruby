class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :image
      t.text :description
      t.timestamps
    end
    add_index :users, :id, unique: true
  end
end