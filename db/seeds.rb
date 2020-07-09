# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroying database
Brand.destroy_all
Shoe.destroy_all
Runner.destroy_all
Run.destroy_all
RunnerShoe.destroy_all
User.destroy_all

admin = Admin.create(
    name: 'admin'
)
User.create(
    username: 'admin',
    password: 'password',
    profileable: admin
)

# Creating brands
BRAND_NAME = ['Nike', 'Asics', 'Adidas', 'New Balance', 'Puma', 'Reebok']
BRAND_NAME.each do |brand_name|
    brand = Brand.create(name: brand_name)
    User.create(
        username: brand_name.downcase.gsub(' ',''),
        password: 'password',
        profileable: brand
    )
end

# Creating shoes
i = 1
26.times do
    shoe = Shoe.create(
        name: Faker::Science.unique.element, 
        price: rand(50.00...200.00).round(2), 
        year: rand(2015...2020), 
        brand: Brand.all.sample
    )
    shoe.avatar.attach(io:File.open(Rails.root.join("app/assets/images/#{i}.jpg")), filename: "#{shoe.name}.jpg")
    i+=1
end

SHOE_SIZE = [7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0, 12.5, 13.0]

# Create runners
50.times do
    runner = Runner.create(
        name: Faker::Name.name,
        age: rand(18...65),
        shoe_size: SHOE_SIZE.sample
    )
    User.create(
        username: "#{runner.name.gsub(' ','').downcase}#{rand(1..500)}",
        password: 'password',
        profileable: runner
    )

    runner.shoes << Shoe.all.sample(rand(1..6))

    rand(30..200).times do 
        Run.create(
            distance: rand(0.0...26.2).round(1),
            time: rand(0.0...21600.0).round(2),
            date: Faker::Date.between(from: '2020-01-01', to: '2020-07-09'),
            runner: runner,
            runner_shoe: runner.runner_shoes.sample,
            location: Faker::Address.city
        )
    end
end