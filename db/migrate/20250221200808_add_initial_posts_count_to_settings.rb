class AddInitialPostsCountToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :initial_posts_count, :integer, default: 5
  end
end
