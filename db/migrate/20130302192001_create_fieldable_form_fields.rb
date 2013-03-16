class CreateFieldableFormFields < ActiveRecord::Migration
  def change
    create_table :fieldable_form_fields do |t|
      t.string :name
      t.string :type
      t.text :options

      t.integer :fieldable_id
      t.string :fieldable_type

      t.timestamps
    end

    add_index :fieldable_form_fields, :fieldable_id
  end
end
