require 'rails_helper'
RSpec.describe '質問投稿機能', type: :system do
  before do
    @user1 = FactoryBot.create(:basic_user)
    @user2 = FactoryBot.create(:basic2_user)
    @question1 = FactoryBot.create(:question1, user: @user1)
    @question2 = FactoryBot.create(:question2, user: @user2)
  end
  describe 'CRUD機能のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '新規投稿した場合' do
      it '登録が完了できる' do
        visit new_question_path
        fill_in 'question[content]', with: 'test'
        fill_in 'question[sentence]', with: 'test_test'
        fill_in 'question[reminiscent_words_attributes][0][keyword]', with: 'test_test_test'
        click_on '質問を投稿する'
        expect(page).to have_content '質問を投稿しました'
        expect(page).to have_content 'test'
      end
    end
    context '編集した場合' do
      it '編集され、投稿詳細ページに飛ぶ' do
        visit edit_question_path(@question1)
        fill_in 'question[content]', with: 'edit'
        click_on '変更する'
        expect(page).to have_content '質問投稿を編集しました'
        expect(page).to have_content 'edit'
      end
    end
    context '投稿を削除した場合' do
      before do
        visit question_path(@question1)
      end
      it '削除され、投稿一覧ページに飛ぶ' do
        click_link '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '質問投稿を削除しました'
        expect(page).to have_content '質問一覧'
      end
    end
  end

  describe '絞り込み機能テスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context 'ステータスで絞り込んだ場合' do
      it "指定したステータスが絞り込まれる" do
        select '解決済', from: 'search_status'
        click_button '絞り込み'
        expect(page).to have_content '解決済'
        expect(page).to have_content '質問内容2'
        expect(page).not_to have_content '質問内容1'
      end
    end
  end
  describe 'アクセス制限のテスト' do
    context 'ログインせずに質問詳細に飛ぼうとした場合' do
      it 'アクセス制限がかかり、飛ぶことができない' do
        visit question_path(@question2)
        expect(page).to have_content 'ログインもしくはアカウント登録してください'
      end
    end
  end
  describe 'アクセス制限のテスト' do
    before do
      visit edit_question_path(@question2)
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '自分が投稿してない投稿を編集しようとした場合' do
      it 'アクセス制限がかかり、編集ができない' do
        visit edit_question_path(@question2)
        expect(page).to have_content 'ログインもしくはアカウント登録してください'
      end
    end
  end
end
