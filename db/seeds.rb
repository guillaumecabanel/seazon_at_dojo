print 'Delete data..........'
# User.destroy_all
Order.destroy_all
Serving.destroy_all
Meal.destroy_all
puts 'OK'

# print 'Create users.........'
# User.create!(
#   email:      'user@example.com',
#   password:   'password',
# )
# puts 'OK'

print 'Create meals.........'
10.times do
  Meal.create!(
    title: Faker::Food.dish,
  )
end
puts 'OK'

print 'Create servings......'
meals = Meal.all
10.times do |i|
  Serving.create!(
    meal:        meals[i],
    best_before: Date.today + 7.days,
    quantity:    rand(1..6),
    price:       7.0
  )
end
puts 'OK'
