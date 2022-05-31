class Cat < ApplicationRecord
  belongs_to :author, inverse_of: :cats, class_name: 'User', foreign_key: 'author_id'
  has_many :cat_bills
  has_many :bills, through: :cat_bills
  has_one_attached :icon

  validates :name, presence: true
  validates :author_id, presence: true
end
