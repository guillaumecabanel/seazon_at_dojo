print 'Delete data..........'
# User.destroy_all
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
