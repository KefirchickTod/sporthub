require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ROOT = "#{Rails.root}/db/seeders/"
DIRS = [
 'users',
 'categories',
 'article',
 'comments'
].map { |x| "#{ROOT}#{x}.seed.rb" }


# Main fn for run seed
def run
  DIRS.each do |seed|
    puts "Star seeding #{seed}"

    load seed

    sleep 0.2
  end
end


begin
  run
rescue => e
  puts "Error with seed: #{e.to_s}"
  #system("rails db:truncate_all")
rescue
  puts "Get error"
  #system("rails db:truncate_all")
end


