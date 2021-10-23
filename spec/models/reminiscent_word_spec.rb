require 'rails_helper'
RSpec.describe '連想ワード機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:basic_user)
      @question = FactoryBot.create(:question1, user: @user)
    end
    context 'ユーザーが質問に対して連想ワードを入力した場合' do
      it "バリデーションが通る" do
        reminiscent_word = FactoryBot.build(:reminiscent_word1, question: @question)
        expect(reminiscent_word).to be_valid
      end
    end
    context '連想ワードが空の場合' do
      it "バリデーションに引っかかる" do
        reminiscent_word = FactoryBot.build(:reminiscent_word1, question: @question, keyword: nil)
        expect(reminiscent_word).not_to be_valid
      end
    end
    context '連想ワードが50文字以上の場合' do
      it "バリデーションに引っかかる" do
        reminiscent_word = FactoryBot.build(:reminiscent_word1, question: @question, keyword: 'N'*51)
        expect(reminiscent_word).not_to be_valid
      end
    end
  end
end