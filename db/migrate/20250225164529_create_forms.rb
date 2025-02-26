class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.string :description
      t.string :status, default: 'active'
      t.datetime :required_by

      t.timestamps
    end
  end
end
