require 'rails_helper' 

RSpec.describe CommentsController, type: :controller do
  user = FactoryBot.create(:user)   
  post = user.posts.create(FactoryBot.attributes_for(:post))
  comment = post.comments.create(user_id: user.id, description: FactoryBot.attributes_for(:comment))
end
