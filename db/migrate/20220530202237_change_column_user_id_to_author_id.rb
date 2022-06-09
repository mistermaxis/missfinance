class ChangeColumnUserIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :cats, :user_id, :author_id
  end
end
