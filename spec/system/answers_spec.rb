require 'rails_helper'
RSpec.describe '質問回答機能（コメント機能）', type: :system do
  before do
    @user1 = FactoryBot.create(:basic_user)
    @user2 = FactoryBot.create(:basic2_user)
    @question1 = FactoryBot.create(:question1, user: @user1)
    @question2 = FactoryBot.create(:question2, user: @user2)
  end

  describe '質問回答のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      visit new_question_answer_path(@question2)
    end
    context '質問に対して新規回答した場合' do
      it '回答が登録される' do
        fill_in 'answer[answer_words_attributes][0][candidate]', with: 'test_answer'
        fill_in 'answer[comment]', with: 'test_answer_comment'
        click_on '回答する'
        expect(page).to have_content 'test_answer'
        expect(page).to have_content 'test_answer_comment'
      end
    end
    context '回答を空で「回答する」を押した場合' do
      it '回答は作成できない' do
        click_on '回答する'
        expect(page).to have_content '回答できませんでした'
      end
    end
    context '削除を押した場合' do
      before do
        fill_in 'answer[answer_words_attributes][0][candidate]', with: 'test_answer'
        fill_in 'answer[comment]', with: 'test_answer_comment'
        click_on '回答する'
        expect(page).to have_content 'test_answer'
        expect(page).to have_content 'test_answer_comment'
      end
      it '回答が削除される' do
        click_link '回答削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_no_content 'test_answer'
      end
    end
  end
end
