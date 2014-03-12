class AddIndexToConvos < ActiveRecord::Migration
  def change
    add_index :convos, :user_id
  end
end
