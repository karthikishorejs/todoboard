require 'rails_helper' 

RSpec.describe PostsController, type: :controller do
  before do 
    @user = FactoryBot.create(:user)
    @post = @user.posts.create(FactoryBot.attributes_for(:post))
  end

  describe 'GET index' do
    it 'exists and responds' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET show' do
    it 'exists and responds' do
      get :show, params: {id: @post.id}
      expect(response.status).to eq(200)
    end
  end

  describe 'GET new' do
    it 'exists and responds' do
      sign_in @user
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT update' do
    it 'modifies a record' do
      sign_in @user
      put :update, params: { id: @post.id, post: { title: 'update title' } }

      expect(Post.where(id: @post.id).count).to eq(1)
      expect(Post.find(@post.id).title).to eq('update title')
      expect(response.status).to be(302)
    end
  end
  
  describe 'DELETE destroy' do
    it 'deletes a record' do
      sign_in @user
      delete :destroy, params: {id: @post.id}
      expect(Post.where(id: @post.id)[0]).to eq(nil)
    end
  end
end