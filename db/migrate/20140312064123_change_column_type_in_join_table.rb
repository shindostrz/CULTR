class ChangeColumnTypeInJoinTable < ActiveRecord::Migration
  def change
    drop_table :convos_users
    create_table :convos_users do |t|
      t.belongs_to :user
      t.belongs_to :convo
    end
  end
end
