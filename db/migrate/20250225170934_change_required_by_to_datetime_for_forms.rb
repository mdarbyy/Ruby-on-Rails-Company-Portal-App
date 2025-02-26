class ChangeRequiredByToDatetimeForForms < ActiveRecord::Migration[7.0]
  def change
    change_column :forms, :required_by, :datetime
  end
end
