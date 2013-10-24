class CreateConvos < ActiveRecord::Migration
  def change
    create_table :convos do |t|
      t.integer :user_id
      t.string :topic
      t.string :age
      t.string :gender
      t.string :description
      t.string :latitude
      t.string :longitude
      t.string :start_time
      t.string :end_time
      t.timestamps
    end
  end
end
