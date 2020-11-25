# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dir1 = Directory.new(name: 'Raiz')
dir1.files = [
  Pathname.new("#{Rails.root}/spec/fixtures/test_file.txt").open,
  Pathname.new("#{Rails.root}/spec/fixtures/test_file_2.txt").open
]
dir1.save!

dir2 = Directory.new(name: 'Filho', directory: dir1)
dir2.files = [
  Pathname.new("#{Rails.root}/spec/fixtures/test_file.txt").open
]

dir2.save!
