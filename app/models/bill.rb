class Bill < ApplicationRecord
  has_many :cat_bills
  has_many :cats through: :cat_bills
end
