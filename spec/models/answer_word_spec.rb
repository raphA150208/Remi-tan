require 'rails_helper'
RSpec.describe 'しっくりくる言葉候補機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:basic_user)
      @question = FactoryBot.create(:question1, user: @user)
      @answer = FactoryBot.create(:answer1, user: @user, question: @question)
    end

    context 'しっくりくる言葉候補が空の場合' do
      it 'バリデーションに引っかかる' do
        answer_word = FactoryBot.build(:answer_word1, candidate: nil, answer: @answer)
        expect(answer_word).not_to be_valid
      end
    end
    context 'しっくりくる言葉候補が50文字以上の場合' do
      it 'バリデーションに引っかかる' do
        answer_word = FactoryBot.build(:answer_word1, candidate: 'N'*51 , answer: @answer)
        expect(answer_word).not_to be_valid
      end
    end
    context 'しっくりくる言葉候補を正しく入力した場合' do
      it 'バリデーションが通る' do
        answer_word = FactoryBot.build(:answer_word1, answer: @answer)
        expect(answer_word).to be_valid
      end
    end
  end
end