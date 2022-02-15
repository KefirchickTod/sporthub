# Before seed clean all users
User.delete_all
# ActiveRecord::Base.connection.execute("TRUNCATE users RESTART IDENTITY")

# Create main user with id 1

# User.create(id: 1, email: "root@root.com", password: "admin123", password_confirmation: "admin123", first_name: "root", second_name: "root")

# Loop for create another users (3)

3.times do
  password = Faker::Internet.password

  User.create(
    email: Faker::Internet.unique.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Games::ElderScrolls.first_name,
    second_name: Faker::Games::ElderScrolls.last_name
  )
end
