class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :bills, inverse_of: :author, foreign_key: 'author_id'
  has_many :cats, inverse_of: :author, foreign_key: 'author_id'

  validates :name, presence: true
end
