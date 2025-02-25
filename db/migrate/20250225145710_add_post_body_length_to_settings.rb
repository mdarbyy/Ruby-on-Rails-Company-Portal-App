class AddPostBodyLengthToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :post_body_length, :integer, default: 500
  end
end
