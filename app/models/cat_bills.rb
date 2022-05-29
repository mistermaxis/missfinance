class CatBills < ApplicationRecord
  belongs_to :cat
  belongs_to :bill
end
