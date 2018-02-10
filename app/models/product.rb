class Product < ApplicationRecord
  belongs_to :product_category
  has_many :product_plans, dependent: :destroy

  validates :name, :description, :product_category_id, :contract,
            :product_key, presence: true
  has_attached_file :icon, styles: { thumb: '64x64#' },
                           default_url: '/missing.jpg'
  validates_attachment :icon, content_type: { content_type:
                        ['image/jpeg', 'image/gif', 'image/png'] }

  def actual_status
    status ? 'Ativo' : 'Inativo'
  end
end
