require 'rails_helper'

RSpec.feature "Topics", type: :feature do
  let!(:user)  {create(:user)}

  scenario "ユーザーがログインした後新スレッドを作る" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード",    with: user.password
    click_button "ログイン"

    expect{
      click_link "新しいスレッドをたてる"
      fill_in "お名前", with: "user_name"
      fill_in "タイトル", with: "title"
      fill_in "内容", with: "sample content"
      click_button "スレッドを作成する"

      expect(page).to have_content "user_name"
      expect(page).to have_content "title"
      expect(page).to have_content "sample content"
    }.to change(Topic.all, :count).by(1)
  end
end
