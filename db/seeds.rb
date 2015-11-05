# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bowser = User.create(
  name: 'Bowser',
  email: 'kingkoopa@airship.com',
  password: 'abc123',
  password_confirmation: 'abc123',
  )

babybowser = bowser.children.create(
  name: 'Baby Bowser',
  birthday: DateTime.parse('95/8/15'),
  user_id: bowser.id
  )

bb1 = babybowser.posts.create(
  title: 'Baby Bowser was born!',
  text: 'A really big stork dropped you off on the airship.  We will rule the mushroom kingdom forever!',
  event_date: DateTime.parse('95/8/15'),
  user_id: bowser.id,
  child_id: babybowser.id,
  image_url: 'http://www.mariowiki.com/images/thumb/0/02/Babybowser.png/408px-Babybowser.png'
  )
