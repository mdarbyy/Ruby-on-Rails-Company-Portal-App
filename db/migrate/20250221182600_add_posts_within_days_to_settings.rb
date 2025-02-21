class AddPostsWithinDaysToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :post_within_days, :integer, default: 5
  end
end