# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  #10.times do
  #  User.create!(
  #  email: Faker::Internet.unique.email,
  #  )
#  end

  test = User.new(
  email: 'test@test.com',
  password: "111111"
  )

  test.skip_confirmation!
  test.save!


users = User.all

10.times do
  RegisteredApplication.create!(
    user: test,
    name: Faker::Food.dish,
    url: Faker::Internet.url
  )
end

apps = RegisteredApplication.all

40.times do
  Event.create!(
    registered_application: apps.sample,
    name: Faker::Ancient.god
  )
end


puts "Seed finished"
puts "#{RegisteredApplication.count} Users created"
puts "#{Event.count} Apps created"
