print 'Delete data..........'
User.destroy_all
puts 'OK'

print 'Create users.........'
User.create!(
  email:      'user@example.com',
  password:   'password',
)
puts 'OK'
