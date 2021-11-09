# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Attendance.destroy_all
Event.destroy_all
User.destroy_all


city = [{name: "Paris", zip_code: "75000"},{name: "Lyon", zip_code: "69000"},{name: "Lille", zip_code: "59000"},{name: "Toulouse", zip_code: "31000"},{name: "Marseille", zip_code: "13000"},{name: "Bordeaux", zip_code: "33000"},{name: "Clermont-Ferrand", zip_code: "63000"},{name: "Le Havre", zip_code: "76000"},{name: "Brest", zip_code: "29000"},{name: "Nantes", zip_code: "44000"}]

10.times do
  user = User.new(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, password: "tatayoyo", description: Faker::Lorem.paragraph_by_chars(number: rand(300..500)))
  user.email = "#{user.first_name.gsub(" ",".").downcase}@yopmail.fr"
  user.save
end

10.times do
  Event.create(start_date: Faker::Date.forward(days: 365), duration: [60,90,120,240].sample(1).first, title: Faker::Lorem.paragraph_by_chars(number: rand(5..140)), description: Faker::Lorem.paragraph_by_chars(number: rand(300..500)), price: [0,5,10,15,20].sample(1).first, administrator: User.all.sample(1).first, location: city.sample(1).first[:name])
end

10.times do
  Event.create(start_date: Faker::Date.backward(days: 365), duration: [60,90,120,240].sample(1).first, title: Faker::Lorem.paragraph_by_chars(number: rand(5..140)), description: Faker::Lorem.paragraph_by_chars(number: rand(300..500)), price: [0,5,10,15,20].sample(1).first, administrator: User.all.sample(1).first, location: city.sample(1).first[:name])
end

Event.all.each do |event|
  rand(1..10).times do
    Attendance.create(event: event, participant: User.all.reject{|user| user.id == event.administrator_id}.sample(1).first, stripe_customer_id: "###########")
  end
end