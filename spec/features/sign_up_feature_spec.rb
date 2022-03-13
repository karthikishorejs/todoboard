require 'rails_helper'

describe 'User signs up', type: :system do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 6) }
  let(:name_full) { Faker::Name.name}

  scenario 'with invalid data' do
    visit 'sign_up'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Name full can't be blank")
    expect(page).to have_content("Name full is too short (minimum is 5 characters)")
  end

  scenario 'with valid data' do
    visit 'sign_up'
    within('#sign_up_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      fill_in 'Name full', with: name_full
    end
    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    click_link "#{email}"
    click_link 'Logout'
  end
end