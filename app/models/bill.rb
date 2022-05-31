class Bill < ApplicationRecord
  has_many :cat_bills
  has_many :cats, through: :cat_bills
  belongs_to :author, inverse_of: :bills, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: true
end
