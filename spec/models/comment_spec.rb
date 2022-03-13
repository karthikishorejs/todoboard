require 'rails_helper'

describe 'Comment', type: :model do 

	subject { FactoryBot.build(:comment)}

	context 'validations' do 
		it { should validate_presence_of(:description) }
	end

	context 'associations' do 
		it { should belong_to(:post) }
		it { should belong_to(:user) }
	end

	before do 
		@user = FactoryBot.create(:user)   
  	@post = @user.posts.create(FactoryBot.attributes_for(:post))
  	@comment = @post.comments.create(user_id: @user.id, description: FactoryBot.attributes_for(:comment))
	end
  
    
  describe 'Comments' do
		it 'can be created' do
			expect(Comment.where(id: @comment.id).count).to eq(1)
			expect(Comment.find(@comment.id).user_id).to eq(@user.id)
			expect(Comment.find(@comment.id).post_id).to eq(@post.id)
      expect(Comment.find(@comment.id).description).to eq(@comment.description)
		end
  end

	describe 'Comments' do
    it 'can be deleted' do
      @user.destroy
		  @post.destroy
      expect(Comment.where(id: @comment.id)[0]).to eq(nil)
    end
  end
end