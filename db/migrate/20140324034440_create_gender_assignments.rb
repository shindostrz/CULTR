class CreateGenderAssignments < ActiveRecord::Migration
  def change
    create_table :gender_assignments do |t|
      t.integer :gender_id
      t.integer :genderable_id
      t.string :genderable_type

      t.timestamps
    end
    add_index :gender_assignments, [:genderable_id, :genderable_type]
  end
end
