require 'rails_helper'
RSpec.describe '連想ワード辞書機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:basic_user)
      @question = FactoryBot.create(:question1, user: @user)
    end

    context 'しっくりくる言葉候補と連想ワードが入力された場合' do
      it "バリデーションが通る" do
        reminiscent_words_dictionary = FactoryBot.build(:reminiscent_words_dictionary2)
        expect(reminiscent_words_dictionary).to be_valid
      end
    end
    context 'しっくりくる言葉候補が空の場合' do
      it "バリデーションが引っかかる" do
        reminiscent_words_dictionary = FactoryBot.build(:reminiscent_words_dictionary2, answer_word: nil)
        expect(reminiscent_words_dictionary).not_to be_valid
      end
    end
    context '連想ワードが空の場合' do
      it "バリデーションが引っかかる" do
        reminiscent_words_dictionary = FactoryBot.build(:reminiscent_words_dictionary2, reminiscent_word: nil)
        expect(reminiscent_words_dictionary).not_to be_valid
      end
    end
    context 'しっくりくる言葉候補が50文字以上の場合' do
      it 'バリデーションに引っかかる' do
        reminiscent_words_dictionary = FactoryBot.build(:reminiscent_words_dictionary2, answer_word: 'N'*51)
        expect(reminiscent_words_dictionary).not_to be_valid
      end
    end
    context '連想ワードが50文字以上の場合' do
      it 'バリデーションに引っかかる' do
        reminiscent_words_dictionary = FactoryBot.build(:reminiscent_words_dictionary2, reminiscent_word: 'N'*51)
        expect(reminiscent_words_dictionary).not_to be_valid
      end
    end
  end
end
