class AddIndexToConvosIdAndUserIdInResponses < ActiveRecord::Migration
  def change
    add_index :responses, :convo_id
    add_index :responses, :user_id
  end
end
