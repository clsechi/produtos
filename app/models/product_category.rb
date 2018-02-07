class ProductCategory < ApplicationRecord
  validates :name, :description, presence: true
  has_many :products, dependent: :destroy
end
