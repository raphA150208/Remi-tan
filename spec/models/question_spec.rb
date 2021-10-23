require 'rails_helper'
RSpec.describe '質問機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:basic_user)
    end

    context 'contentが空の場合' do
      it 'バリデーションに引っかかる' do
        question = FactoryBot.build(:question1, content: nil, user: @user)
        expect(question).not_to be_valid
      end
    end
    context 'contentが入力されているの場合' do
      it 'バリデーションが通る' do
        question = FactoryBot.build(:question1, user: @user)
        expect(question).to be_valid
      end
    end
    context 'contentが1000文字以上の場合' do
      it 'バリデーションに引っかかる' do
        question = FactoryBot.build(:question1, content: 'N'*1001)
        expect(question).not_to be_valid
      end
    end
  end
end