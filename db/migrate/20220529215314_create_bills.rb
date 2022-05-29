class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.text :name
      t.float :amount

      t.timestamps
    end
  end
end
