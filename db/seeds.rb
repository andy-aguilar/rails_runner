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

# Creating brands
5.times do
    Brand.create(name: Faker::Esport.unique.player)
end

# Creating shoes
25.times do
    Shoe.create(
        name: Faker::Science.unique.element, 
        price: rand(50.00...200.00).round(2), 
        year: rand(2015...2020), 
        brand: Brand.all.sample
    )
end

SHOE_SIZE = [7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0, 12.5, 13.0]

# Create runners
10.times do
    Runner.create(
        name: Faker::GreekPhilosophers.unique.name,
        age: rand(18...65),
        height: rand(48...96),
        weight: rand(100...300),
        shoe_size: SHOE_SIZE.sample
    )
end

Runner.all.each do |runner|
    runner.shoes << Shoe.all.sample(3)
    
    3.times do 
        Run.create(
            distance: rand(0.0...26.2).round(1),
            time: rand(0.0...21600.0).round(2),
            date: '2020-07-06',
            runner: runner,
            runner_shoe: runner.runner_shoes.sample
        )
    end
end