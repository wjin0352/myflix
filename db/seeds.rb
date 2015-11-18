# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
comedy = Category.create(name: 'comedy')
drama = Category.create(name: 'drama')
mystery = Category.create(name: 'mystery')

family_guy = Video.create(title: 'family guy', description: 'Comedy series', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/family_guy.jpg', cover_image_url: '/tmp/family_guy.jpg', category: comedy)

futurama = Video.create(title: 'futurama', description: 'Comedy cartoon', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/futurama.jpg', cover_image_url: '/tmp/futurama.jpg', category: comedy)

south_park = Video.create(title: 'south park', description: 'award winning cartoon series', small_cover_url: '/tmp/south_park.jpg',
  large_cover_url: '/tmp/south_park.jpg', cover_image_url: '/tmp/south_park.jpg', category: comedy)

monk = Video.create(title: 'monk', description: 'mystery series', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', cover_image_url: '/tmp/monk.jpg', category: mystery)
