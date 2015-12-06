# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  User.create!(
    username: Faker::Internet.user_name,
    password: 'password',
    email: 'test@example.com'
  )
end

10.times do
  Post.create!(
    title: Faker::Lorem.sentence(3),
    body: " <p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory.</p>

                 <p>Science cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science.</p>

                 <p>What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.</p>

                 <p>A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That's how I felt seeing the Earth for the first time. I could not help but love and cherish her.</p>

                 <p>For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.</p>",
    user_id: (1..10).to_a.sample
  )
end


10.times do
  Comment.create!(
    body: Faker::Lorem.sentence(10),
    user_id: (1..10).to_a.sample,
    post_id: (1..10).to_a.sample
  )
end

100.times do
  Vote.create!(
    user_id: (1..10).to_a.sample,
    votable_type: ['Post', 'Comment'].sample,
    votable_id: (1..10).to_a.sample
  )
end


