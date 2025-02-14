class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.integer :entity_limit, default: 5

      t.timestamps
    end
  end
end
