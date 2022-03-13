require 'rails_helper'

RSpec.describe 'Routing to posts', type: :routing do
  it 'routes /posts to the post#index' do
    expect(get: '/posts').to route_to(
      controller: 'posts', 
      action: 'index'      
    )
  end

  it 'routes /posts/1 to the post#show' do
    expect(get: '/posts/1').to route_to(
      controller: 'posts', 
      action: 'show', 
      id: '1'
    )
  end

  it 'routes /posts/new to posts#new' do
    expect(get: '/posts/new').to route_to(
      controller: 'posts', 
      action: 'new'
    )
  end

  it 'routes /posts to posts#create' do
    expect(post: '/posts').to route_to(
      controller: 'posts',
      action: 'create'
    )
  end

  it 'routes /posts/1/edit to posts#edit' do 
    expect(get: '/posts/1/edit').to route_to(
      controller: 'posts',
      action: 'edit',
      id: '1'
    )
  end

  it 'routes /posts/1 to the post#update' do
    expect(put: '/posts/1').to route_to(
      controller: 'posts',
      action: 'update',
      id: '1'
    )
  end

  it 'routes /posts/1 to the post#destroy' do
    expect(delete: 'posts/1').to route_to(
      controller: 'posts',
      action: 'destroy',
      id: '1'
    )
  end

end