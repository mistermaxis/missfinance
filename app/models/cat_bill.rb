class CatBill < ApplicationRecord
  belongs_to :cat
  belongs_to :bill

  validates :cat_id, presence: true
  validates :bill_id, presence: true
end
