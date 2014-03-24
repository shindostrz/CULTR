class RemoveGenderFromConvos < ActiveRecord::Migration
  def up
    remove_column :convos, :gender, :string
  end

  def down
    add_column :convos, :gender, :string
  end
end
