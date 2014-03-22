class RenameConvosUsersToResponses < ActiveRecord::Migration
  def up
    rename_table :convos_users, :responses
  end

  def down
    rename_table :responses, :convos_users
  end
end
