require 'rails_helper'

RSpec.describe 'Routing to users', type: :routing do
  it 'routes /sign_in to the Users::SessionsController#new' do
    expect(get: '/sign_in').to route_to(
      controller: 'users/sessions',
      action: 'new'
    )
  end

  it 'routes /sign_up to the Users::RegistrationsController#new' do
    expect(get: '/sign_up').to route_to(
      controller: 'users/registrations',
      action: 'new'
    )
  end

  it 'routes /users/edit to the Users::RegistrationsController#edit' do 
    expect(get: '/users/edit').to route_to(
      controller: 'users/registrations',
      action: 'edit'
    )
  end

  it 'routes /password/new to the Users::PasswordsController#new' do 
    expect(get: '/users/password/new').to route_to(
      controller: 'users/passwords',
      action: 'new'
    )
  end

  it 'routes /password/edit to the Users::PasswordsController#new' do 
    expect(get: '/users/password/edit').to route_to(
      controller: 'users/passwords',
      action: 'edit'
    )
  end
end