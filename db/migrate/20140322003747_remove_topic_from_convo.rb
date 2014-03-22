class RemoveTopicFromConvo < ActiveRecord::Migration
  def up
    remove_column :convos, :topic, :string
  end

  def down
    add_column :convos, :topic, :string
  end
end
