class CreateFieldableForms < ActiveRecord::Migration
  def change
    create_table :fieldable_forms do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :type

      t.timestamps
    end

    add_index :fieldable_forms, :owner_id
  end
end
