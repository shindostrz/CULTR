class AddLocDescToConvos < ActiveRecord::Migration
  def change
    add_column :convos, :loc_desc, :text
  end
end
