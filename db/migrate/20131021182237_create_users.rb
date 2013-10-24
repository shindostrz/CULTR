class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :age
      t.string :gender
      t.string :interests
      t.string :writers
      t.string :works
      t.string :quotes
      t.string :remember_token
      t.timestamps
    end
  end
end
