class CreateFormSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :form_submissions do |t|
      t.references :form, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :answer
      t.datetime :completed_on

      t.timestamps
    end
  end
end
