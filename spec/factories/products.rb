FactoryBot.define do
  factory :product do
    name 'Hospedagem'
    description 'Hospedagem ilimitada'
    product_key 'HOSP123'
    contract 'contrato123'
    icon { File.new(Rails.root.join('spec', 'support', 'fixtures', 'img.png')) }
  end
end
