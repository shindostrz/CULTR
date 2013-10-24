class CreateUsersConvosJoinTable < ActiveRecord::Migration
  def change
    create_table :users_convos, id: false do |t|
      t.integer :user_id
      t.integer :convo_id
    end
  end

end
