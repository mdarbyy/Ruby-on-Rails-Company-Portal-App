class CreateFormFields < ActiveRecord::Migration[7.0]
  def change
    create_table :form_fields do |t|
      t.references :form, null: false, foreign_key: true
      t.string :label, null: false
      t.string :description
      t.string :field_type, null: false

      t.timestamps
    end
  end
end
