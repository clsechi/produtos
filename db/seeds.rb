# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
periodicity = Periodicity.create(name: 'Anual', period: '12')

category = ProductCategory.create(name: 'Hospedagem',
description: 'Hospedagem ilimitada')

product = Product.create(name: 'Hospedagem', product_key: 'HOSP123',
description: 'Hospedagem ilimitada', contract: 'contrato123',
product_category_id: category.id)

plan = ProductPlan.create(duration: 12, product_id: product.id)

PlanPrice.create(value: 120, product_plan_id: plan.id,
                 periodicity_id: periodicity.id)
