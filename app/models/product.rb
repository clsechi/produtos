class Product < ApplicationRecord
  belongs_to :product_category
  has_many :product_plans, dependent: :destroy

  validates :name, :description, :product_category_id, :contract,
            :product_key, presence: true
end
