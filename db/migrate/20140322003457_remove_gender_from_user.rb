class RemoveGenderFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :gender, :string
  end

  def down
    add_column :users, :gender, :string
  end
end
