class AddMaxPostTitleLengthToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :max_post_title_length, :integer, default: 100
  end
end
