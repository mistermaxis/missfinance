class Cat < ApplicationRecord
  has_many: :cat_bills
  has_many: :bills through: :cat_bills
end
