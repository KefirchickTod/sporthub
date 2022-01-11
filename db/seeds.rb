require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Dir[File.join(Rails.root, 'db', 'seeders', '*.rb')].sort.each do |seed|

  puts "Star seeding #{seed}"


  begin
    load seed
  rescue
    puts "Some error with seeding #{seed}"
  end

  sleep 0.2

end