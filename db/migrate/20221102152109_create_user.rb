class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.integer :postsCounter

      t.timestamps
    end
  end
end
