require 'rails_helper'

describe 'User', type: :model do   
  subject {
    FactoryBot.build(:user)
  }

  context 'validations' do 
    it { should validate_presence_of(:name_full) }
    it { should validate_presence_of(:email) }
    it do
      should validate_length_of(:name_full).is_at_least(5).on(:create)
    end
  end

  context 'associations' do 
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end

  before do 
    @user = FactoryBot.create(:user)
  end

  describe 'creation' do 
    it 'can be created' do
      expect(User.where(id: @user.id).count).to eq(1)
      expect(User.find(@user.id).id).to eq(@user.id)
    end
  end

  describe 'deletion' do 
    it 'can be deleted' do
      @user.destroy
      expect(User.where(id: @user.id)[0]).to eq(nil)
    end
  end
end