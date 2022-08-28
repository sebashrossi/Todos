# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
User.destroy_all


puts ""
puts "Creating users..."
puts ""
10.times do
  user = User.new(name: "#{Faker::Name.unique.first_name} #{Faker::Name.unique.last_name}")
  user.email = Faker::Internet.email(name: user.name, domain: 'netenders.com')
  user.save!
end

puts ""
puts "Creating Todos..."
puts ""
status = ['to_do', 'doing', 'done']
40.times do
  Todo.create(name: Faker::Hobby.activity, status: status.sample, user_id: User.all.sample.id)
end

puts ""
puts "Created: "
puts ""
puts "Users: #{User.count}"
puts "Todos: #{Todo.count}"