class CreateCatBills < ActiveRecord::Migration[7.0]
  def change
    create_table :cat_bills do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
