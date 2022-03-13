require 'rails_helper'

describe 'User forgets password', type: :system do
  let(:invalid_email) {}
  let(:valid_email) { Faker::Internet.email }

  scenario 'page has links and button' do
    visit 'forgot_password'
    expect(page).to have_text('Forgot your password?')
    expect(page).to have_button('Send me reset password instructions')
    expect(page).to have_link 'Log in'
    expect(page).to have_link 'Sign up'
  end
  
  scenario 'with invalid email' do 
    visit 'forgot_password'
    fill_in 'Email', with: invalid_email
    click_button 'Send me reset password instructions'
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'redirects to login page' do
    visit 'forgot_password'
    click_link 'Log in'
    expect(page).to have_content 'Log in'
  end

  scenario 'redirects to signup page' do
    visit 'forgot_password'
    click_link 'Sign up'
    expect(page).to have_content 'Sign up'
  end
end
