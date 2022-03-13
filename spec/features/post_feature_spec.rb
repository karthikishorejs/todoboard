require 'rails_helper'

describe 'Posts', type: :system do
  let(:valid_email) { Faker::Internet.email }
  let(:post_title) { Faker::Lorem.sentence }
  let(:post_description) { Faker::Lorem.paragraph } 
  let(:post_update_title) { Faker::Lorem.sentence }
  let(:post_update_description) { Faker::Lorem.paragraph }

  before do 
    @user = FactoryBot.create(:user)
    @post = @user.posts.create(FactoryBot.attributes_for(:post))
  end

  scenario 'has valid text field and buttons' do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    click_link 'New Post'
    expect(page).to have_content('New Post')
    expect(page).to have_field('Title')
    expect(page).to have_button('Save')
    expect(page).to have_link('Back')
    click_link "#{@user.email}"
    click_link 'Logout'
  end

  scenario 'create' do  
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    click_link 'New Post'
    fill_in 'Title', with: post_title
    find('#post_description').set("#{post_description}")
    click_button 'Save'
    expect(page).to have_content("#{post_title}")
    expect(page).to have_content("#{post_description}")
    expect(page).to have_content("Post was successfully created.")
    click_link "#{@user.email}"
    click_link 'Logout'
  end

  scenario 'valid index page' do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content("#{@post.title}")
    expect(page).to have_content("Posted by: #{@post.user.name_full}")
    expect(page).to have_link('Show')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Destroy')
    click_link "#{@user.email}"
    click_link 'Logout'
  end

  scenario 'valid show page' do    
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content("#{@post.title}")
    expect(page).to have_content("Posted by: #{@post.user.name_full}")
    visit "posts/#{@post.id}"
    expect(page).to have_content("Title")
    expect(page).to have_content("#{@post.title}")
    expect(page).to have_link('Back')
    click_link "#{@user.email}"
    click_link 'Logout'
  end

  scenario 'valid edit post page' do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content("#{@post.title}")
    expect(page).to have_content("Posted by: #{@post.user.name_full}")
    visit "posts/#{@post.id}/edit"
    expect(page).to have_content("Title")
    fill_in 'Title', with: post_update_title
    click_button 'Save'
    expect(page).to have_content("#{post_update_title}")
    expect(page).to have_link('Back')
    click_link "#{@user.email}"
    click_link 'Logout'
  end
end