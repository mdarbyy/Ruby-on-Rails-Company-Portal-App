class RenamePostBodyLengthToMaxPostBodyLength < ActiveRecord::Migration[7.0]
  def change
    rename_column :settings, :post_body_length, :max_post_body_length
  end
end
