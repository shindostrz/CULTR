class ChangeDataFormatInConvos < ActiveRecord::Migration
  def up
    change_column :convos, :description, :text
  end

  def down
    change_column :convos, :description, :string
  end
end