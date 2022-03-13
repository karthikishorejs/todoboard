require 'rails_helper'

describe 'Comments', type: :system do
  let(:comment_description) { Faker::Lorem.paragraph } 
  before do 
    @user = FactoryBot.create(:user)   
    @post = @user.posts.create(FactoryBot.attributes_for(:post))
    @comment = @post.comments.create(user_id: @user.id, description: FactoryBot.attributes_for(:comment)[:description])
  end

  scenario 'has valid text field and buttons' do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    visit "posts/#{@post.id}"
    expect(page).to have_content("Comments")
    expect(page).to have_content("Leave a comment")
    expect(page).to have_content("Posted by #{@user.name_full}")
    expect(page).to have_content("#{@comment.description}")
    expect(page).to have_field('Description')
    expect(page).to have_button("Submit a comment")
    click_link "#{@user.email}"
    click_link 'Logout'
  end

  scenario 'creates a comment' do 
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    visit "posts/#{@post.id}"
    expect(page).to have_content("1 Comments")
    expect(page).to have_content("Leave a comment")
    expect(page).to have_content("Posted by #{@user.name_full}")
    find('#comment_description').set("#{comment_description}")
    click_button 'Submit a comment'
    expect(page).to have_content("2 Comments")
    expect(page).to have_content("#{comment_description}")
  end
end