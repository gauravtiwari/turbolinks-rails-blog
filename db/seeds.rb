# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


50.times do |i|
  User.create!(
    username: '',
    password: 'password',
    email: 'test@example.com'
  )
end

500.times do
  Post.create!(
    title: Faker::Lorem.sentence(3),
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque, incidunt! Voluptatibus quasi asperiores veritatis nesciunt vitae aliquid, praesentium ratione. Repudiandae, dolor, incidunt. Amet corporis porro eveniet rem, eligendi vero, quae.

        Science cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science.

          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam quo autem nisi nobis nemo labore explicabo repellat deserunt harum sequi amet odit, alias reiciendis quia, incidunt vel ullam totam rem?
      ",
    user_id: (1..10).to_a.sample
  )
end


500.times do
  Comment.create!(
    body: Faker::Lorem.sentence(10),
    user_id: (1..10).to_a.sample,
    post_id: (90..100).to_a.sample
  )
end

1000.times do
  type = ['Post', 'Comment'].sample
  id = (1..50).to_a.sample
  @vote = Vote.where(user_id: id, votable_id: id, votable_type: type).blank?

  if @vote
    Vote.create!(
      user_id: id,
      votable_type: type,
      votable_id: id
    )
  end
end
