# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
fruits = JSON.load_file('db/fruits.json')
fruits.each do |t|
    Fruit.create(t)
end

require 'csv'
File.open('db/data.csv') do |fh|
  csv = CSV.new(fh, headers: ['name', 'stuid'], converters: [:integer])
  Student.create(csv.map{ |n| n.to_h})
end
