# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    name_full: 'Test User1',
    email: 'testuser1@gmail.com', 
    password: 'password', 
    password_confirmation: 'password'
)

User.create!(
    name_full: 'Test User2',
    email: 'testuser2@gmail.com', 
    password: 'password', 
    password_confirmation: 'password'
)

User.create!(
    name_full: 'Test User3',
    email: 'testuser3@gmail.com', 
    password: 'password', 
    password_confirmation: 'password'
)

Post.create!(
    title: 'First Post'
    desciption: 'With supporting text below as a natural lead-in to additional content.' 
    user_id: User.first.id
)

Post.create!(
    title: 'Second Post'
    desciption: 'With supporting text below as a natural lead-in to additional content.',
    user_id: User.find(2).id
)

Post.create!(
    title: 'Third Post'
    desciption: 'With supporting text below as a natural lead-in to additional content.',
    user_id: User.find(3).id
)

Comment.create!(
    desciption: 'test comment',
    user_id: User.first.id,
    post_id: Post.first.id
)

Comment.create!(
    desciption: 'test comment2',
    user_id: User.first.id,
    post_id: Post.first.id
)

Comment.create!(
    desciption: 'test comment3',
    user_id: User.first.id,
    post_id: Post.first.id
)