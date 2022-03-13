require 'rails_helper'

describe 'User signs in', type: :system do
  before do 
    @user = FactoryBot.create(:user)
  end

  scenario 'page has valid links' do 
    visit 'sign_in'
    expect(page).to have_link 'Sign up'
    expect(page).to have_link 'Forgot your password?'
  end

  scenario 'invalid with invalid password' do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'testpass'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
    expect(page).to have_no_link 'Logout'
  end

  it 'valid with correct credentials' do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    click_link "#{@user.email}"
    click_link 'Logout'
  end

  it 'valid with correct credentials to edit' do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    click_link "#{@user.email}"
    click_link 'Settings'
    expect(page).to have_content 'Edit User'
    expect(page).to have_button 'Update'
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_field('Password confirmation')
    expect(page).to have_field('Name full')
    expect(page).to have_content 'Cancel my account'
    expect(page).to have_link 'Back'
  end

  scenario "invalid with unregistered account" do
    visit 'sign_in'
    within('#login') do
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: 'testpass12'
    end
    click_button 'Log in'
    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Logout'
  end
end

