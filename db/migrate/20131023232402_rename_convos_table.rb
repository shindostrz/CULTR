class RenameConvosTable < ActiveRecord::Migration
  def change
    rename_table :users_convos, :convos_users
  end

end
