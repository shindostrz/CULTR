class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :category
      t.belongs_to :convo

      t.timestamps
    end
    add_index :categorizations, :category_id
    add_index :categorizations, :convo_id
  end
end
