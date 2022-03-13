require 'rails_helper'

describe 'Post', type: :model do 
  subject { FactoryBot.build(:post)}

  context 'validations' do 
    it { should validate_presence_of(:title) }    
    it { should validate_presence_of(:description) }
    it do
      should validate_length_of(:title).is_at_least(5).on(:create)
    end
    it do 
      should validate_length_of(:title).is_at_most(50).on(:create)
    end
  end

  context 'associations' do 
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  before do 
    @user = FactoryBot.create(:user)
    @post = @user.posts.create(FactoryBot.attributes_for(:post))
  end
  

  describe 'Posts' do
    it 'can be created' do
      expect(Post.where(id: @post.id).count).to eq(1)
      expect(Post.find(@post.id).user_id).to eq(@user.id)
      expect(Post.find(@post.id).title).to eq(@post.title)
      expect(Post.find(@post.id).description).to eq(@post.description)
    end
  end

  describe 'Posts' do
    it 'can be deleted' do
      @user.destroy
      expect(Post.where(id: @post.id)[0]).to eq(nil)
    end
  end
end