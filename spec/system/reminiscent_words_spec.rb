require 'rails_helper'
RSpec.describe '連想ワード機能', type: :system do
  before do
    @user1 = FactoryBot.create(:basic_user)
    @user2 = FactoryBot.create(:basic2_user)
    @question1 = FactoryBot.create(:question1, user: @user1)
    @question2 = FactoryBot.create(:question2, user: @user2)
    @reminiscent_words_dictionary1 = FactoryBot.create(:reminiscent_words_dictionary1)
    @reminiscent_words_dictionary2 = FactoryBot.create(:reminiscent_words_dictionary2)
    @reminiscent_words_dictionary3 = FactoryBot.create(:reminiscent_words_dictionary3)
  end

  describe '連想ワード登録のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '連想ワードを質問とともに登録した場合' do
      it '質問に紐づいて登録される' do
        visit new_question_path
        fill_in 'question[content]', with: 'test'
        fill_in 'question[sentence]', with: 'test_test'
        fill_in 'question[reminiscent_words_attributes][0][keyword]', with: 'test_test_test'
        click_on '質問を投稿する'
        expect(page).to have_content '質問を投稿しました'
        expect(page).to have_content 'test_test_test'
      end
    end
  end

  describe '検索機能のテスト1' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '連想ワードで検索した場合' do
      it '検索した連想ワードに紐づいたしっくりくる言葉が表示される' do
        visit search_path
        fill_in 'q[reminiscent_word_matches_all][]', with: '連想ワード1'
        click_button '検索'
        expect(page).to have_content 'しっくりくる言葉1'
        expect(page).not_to have_content 'しっくりくる言葉2'
      end
    end
  end
  describe '検索機能のテスト2' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '2つの連想ワードで検索した場合' do
      it '検索した連想ワードに紐づいたしっくりくる言葉が表示される' do
        visit search_path
        fill_in 'q[reminiscent_word_matches_all][]', with: '連想ワード2 連想ワード3'
        click_button '検索'
        expect(page).to have_content 'しっくりくる言葉2'
        expect(page).not_to have_content 'しっくりくる言葉1'
      end
    end
  end
end