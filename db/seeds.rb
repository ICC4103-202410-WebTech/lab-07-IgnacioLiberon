# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all
Tag.delete_all
PostTag.delete_all

User.create!(
  name: 'Son Goku',
  email: 'firstsupersaiyan@example.com',
  password: 'itraineveryday'
)

User.create!(
  name: 'Son Gohan',
  email: 'gohan.research@example.com',
  password: 'mysticwarrior789'
)

User.create!(
  name: 'Vegeta',
  email: 'princeofsaiyans@example.com',
  password: 'princeofsaiyans456'
)

User.create!(
  name: 'Piccolo',
  email: 'Namekian_in_earth@example.com',
  password: 'namekianpower321'
)

User.create!(
  name: 'Krilin',
  email: 'Krilin@example.com',
  password: 'distructodisk567'
)

users = User.all

posts_data = [
  {
    user: users.find_by(name: "Son Goku"),
    title: "Training on my way to Namek",
    content: "I just leaved to Namek and to kill time I started training! This gravity thing is really tough!",
    answers_count: 28,
    likes_count: 10,
    published_at: DateTime.parse("762-12-19T19:56:03+00:00"),
    created_at: DateTime.parse("762-12-19T19:56:03+00:00")
  },
  {
    user: users.find_by(name: "Son Gohan"),
    title: "Still waiting for Dad to get home",
    content: "Still haven't seen Dad since the battle with Frieza. I hope he's ok",
    answers_count: 23,
    likes_count: 7,
    published_at: DateTime.parse("764-01-07T15:30:03+00:00"),
    created_at: DateTime.parse("764-01-07T15:30:03+00:00")
  },
  {
    user: users.find_by(name: "Vegeta"),
    title: "Achieving Super Saiyan Form",
    content: "I finally transformed into a Super Saiyan to surpass Kakarot. Who will be the true Saiyan prince?",
    answers_count: 5,
    likes_count: 14,
    published_at: DateTime.parse("764-04-15T18:45:35+00:00"),
    created_at: DateTime.parse("764-04-15T18:45:35+00:00")
  },
  {
    user: users.find_by(name: "Piccolo"),
    title: "Meditating on Namekian Wisdom",
    content: "Reflecting on the wisdom of my Namekian heritage.",
    answers_count: 34,
    likes_count: 58,
    published_at: DateTime.parse("764-04-18T10:58:59+00:00"),
    created_at: DateTime.parse("764-04-18T10:58:59+00:00")
  },
  {
    user: users.find_by(name: "Krilin"),
    title: "Training with Master Roshi",
    content: "Dedicated to improving my martial arts skills under Master Roshi's guidance. Let's keep pushing our limits!",
    answers_count: 18,
    likes_count: 21,
    published_at: DateTime.parse("764-05-04T13:20:40+00:00"),
    created_at: DateTime.parse("764-05-04T13:20:40+00:00")
  },
  {
    user: users.find_by(name: "Vegeta"),
    title: "Training in the Gravity Chamber",
    content: "Pushing the limits in the gravity chamber. Only through intense training can I achieve greatness!",
    answers_count: 3,
    likes_count: 2,
    published_at: DateTime.parse("765-02-01T17:45:31+00:00"),
    created_at: DateTime.parse("765-02-01T17:45:31+00:00")
  },
  {
    user: users.find_by(name: "Son Gohan"),
    title: "Defeating Cell",
    content: "I know me and Dad got really strong after our training, but it's ok for him to be so calm",
    answers_count: 12,
    likes_count: 24,
    published_at: DateTime.parse("767-05-26T10:03:12+00:00"),
    created_at: DateTime.parse("767-05-26T10:03:12+00:00")
  },
  {
    user: users.find_by(name: "Krilin"),
    title: "I'm married!!",
    content: "Me and 18 are now happily married!!",
    answers_count: 22,
    likes_count: 16,
    published_at: DateTime.parse("770-06-01T20:45:59+00:00"),
    created_at: DateTime.parse("770-06-01T20:45:59+00:00")
  },
  {
    user: users.find_by(name: "Son Gohan"),
    title: "First day at School",
    content: "This girl Videl might already suspect I'm the Great Saiyaman",
    answers_count: 8,
    likes_count: 5,
    published_at: DateTime.parse("774-04-08T18:31:41+00:00"),
    created_at: DateTime.parse("774-04-08T18:31:41+00:00")
  },
  {
    user: users.find_by(name: "Son Gohan"),
    title: "IT'S OVER",
    content: "She discovered it...",
    answers_count: 5,
    likes_count: 6,
    published_at: DateTime.parse("774-04-08T10:25:19+00:00"),
    created_at: DateTime.parse("774-04-08T10:25:19+00:00")
  },
]

Tag.create!(
  name: "Tag1"
)
Tag.create!(
  name: "Tag2"
)
Tag.create!(
  name: "Tag3"
)
Tag.create!(
  name: "Tag4"
)
Tag.create!(
  name: "Tag5"
)

posts_data.each do |post_data|
  post_data[:user].posts.create!(
    title: post_data[:title],
    content: post_data[:content],
    answers_count: post_data[:answers_count],
    likes_count: post_data[:likes_count],
    created_at: post_data[:created_at]
  )
end

PostTag.create!(
  post_id: Post.find_by(title: "Training on my way to Namek").id,
  tag_id: Tag.find_by(name: "Tag1").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Training on my way to Namek").id,
  tag_id: Tag.find_by(name: "Tag2").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Still waiting for Dad to get home").id,
  tag_id: Tag.find_by(name: "Tag3").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Achieving Super Saiyan Form").id,
  tag_id: Tag.find_by(name: "Tag2").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Achieving Super Saiyan Form").id,
  tag_id: Tag.find_by(name: "Tag4").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Meditating on Namekian Wisdom").id,
  tag_id: Tag.find_by(name: "Tag5").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Training with Master Roshi").id,
  tag_id: Tag.find_by(name: "Tag1").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Training with Master Roshi").id,
  tag_id: Tag.find_by(name: "Tag4").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Training with Master Roshi").id,
  tag_id: Tag.find_by(name: "Tag5").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Training in the Gravity Chamber").id,
  tag_id: Tag.find_by(name: "Tag3").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Training in the Gravity Chamber").id,
  tag_id: Tag.find_by(name: "Tag4").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Defeating Cell").id,
  tag_id: Tag.find_by(name: "Tag1").id
)
PostTag.create!(
  post_id: Post.find_by(title: "Defeating Cell").id,
  tag_id: Tag.find_by(name: "Tag5").id
)
PostTag.create!(
  post_id: Post.find_by(title: "I'm married!!").id,
  tag_id: Tag.find_by(name: "Tag2").id
)
PostTag.create!(
  post_id: Post.find_by(title: "I'm married!!").id,
  tag_id: Tag.find_by(name: "Tag3").id
)
PostTag.create!(
  post_id: Post.find_by(title: "I'm married!!").id,
  tag_id: Tag.find_by(name: "Tag4").id
)
PostTag.create!(
  post_id: Post.find_by(title: "First day at School").id,
  tag_id: Tag.find_by(name: "Tag3").id
)
PostTag.create!(
  post_id: Post.find_by(title: "First day at School").id,
  tag_id: Tag.find_by(name: "Tag4").id
)
PostTag.create!(
  post_id: Post.find_by(title: "IT'S OVER").id,
  tag_id: Tag.find_by(name: "Tag1").id
)
PostTag.create!(
  post_id: Post.find_by(title: "IT'S OVER").id,
  tag_id: Tag.find_by(name: "Tag2").id
)
PostTag.create!(
  post_id: Post.find_by(title: "IT'S OVER").id,
  tag_id: Tag.find_by(name: "Tag4").id
)
