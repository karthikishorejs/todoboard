require 'rails_helper'

RSpec.describe 'Routing to comments', type: :routing do
  it 'routes /commments to comments#create' do
    expect(post: '/posts/1/comments').to route_to(
      controller: 'comments',
      action: 'create',
      post_id: '1'
    )
  end
end