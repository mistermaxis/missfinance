class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: 'author_id'
      t.text :name
      t.float :amount

      t.timestamps
    end
  end
end
