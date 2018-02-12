# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
periodicity1 = Periodicity.create(name: 'Mensal', period: 1)
periodicity2 = Periodicity.create(name: 'Trimestral', period: 3)
periodicity3 = Periodicity.create(name: 'Semestral', period: 6)
periodicity4 = Periodicity.create(name: 'Anual', period: 12)

category1 = ProductCategory.create(name: 'Hospedagem',
description: 'Hospedagem ilimitada')

category2 = ProductCategory.create(name: 'Cloud e Servidores',
description: 'Soluções de computação na nuvem')

product1 = Product.create(name: 'Hospedagem de Sites', product_key: 'HOSP123',
description: 'Sites ilimitados', contract: 'contrato_hosp_123',
product_category_id: category1.id)

product2 = Product.create(name: 'Registro de Domínio', product_key: 'HOSP321',
description: 'Registre ou transfira o seu domínio', contract: 'contrato_hosp_321',
product_category_id: category1.id)

product3 = Product.create(name: 'Cloud Computing', product_key: 'CC89',
description: 'Hospedagemem cloud com recursos exclusivos', contract: 'contrato_cc_89',
product_category_id: category2.id)

plan = ProductPlan.create(name: 'Hospedagem', product_id: product1.id)

plan1 = ProductPlan.create(name: 'Hospedagem I', product_id: product1.id)
plan2 = ProductPlan.create(name: 'Hospedagem II', product_id: product1.id)

plan3 = ProductPlan.create(name: 'Domínios Nacional', product_id: product2.id)
plan4 = ProductPlan.create(name: 'Jelastic Cloud', product_id: product3.id)

PlanPrice.create(value: 19.90, product_plan_id: plan1.id,
                periodicity_id: periodicity1.id)
PlanPrice.create(value: 200.00, product_plan_id: plan1.id,
               periodicity_id: periodicity2.id)


PlanPrice.create(value: 15.78, product_plan_id: plan2.id,
                periodicity_id: periodicity1.id)
PlanPrice.create(value: 45.78, product_plan_id: plan2.id,
               periodicity_id: periodicity2.id)

PlanPrice.create(value: 45.78, product_plan_id: plan3.id,
               periodicity_id: periodicity2.id)

PlanPrice.create(value: 89.78, product_plan_id: plan4.id,
               periodicity_id: periodicity2.id)

user = User.create(email: 'teste@email.com', password: '123456')
