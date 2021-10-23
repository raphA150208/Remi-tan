require 'rails_helper'
RSpec.describe '回答情報機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:basic_user)
      @question = FactoryBot.create(:question1, user: @user)
    end

    context 'コメントが空の場合' do
      it 'バリデーションに引っかかる' do
        answer = FactoryBot.build(:answer1, comment: nil, user: @user, question: @question1)
        expect(answer).not_to be_valid
      end
    end
    context 'コメントが1000文字以上の場合' do
      it 'バリデーションに引っかかる' do
        answer = FactoryBot.build(:answer1, comment: 'N'*1001, user: @user, question: @question1)
        expect(answer).not_to be_valid
      end
    end
    context 'ユーザーが質問に対してコメントを正しく入力した場合' do
      it 'バリデーションが通る' do
        answer = FactoryBot.build(:answer1, user: @user, question: @question1)
        expect(answer).not_to be_valid
      end
    end
  end
end