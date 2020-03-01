require 'rails_helper'

RSpec.feature "Responses", type: :feature do
  let!(:user)  {create(:user)}
  let!(:topic) {create(:topic)}

  scenario "ユーザーがログインした後レスポンスできる" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード",    with: user.password
    click_button "ログイン"

    expect{
      click_link "新着スレッド一覧"
      click_link topic.title
      fill_in "お名前",    with: "user_name"
      fill_in "内容",      with: "sample response"
      click_button "返信する"

      expect(page).to have_content topic.title
      expect(page).to have_content "user_name"
      expect(page).to have_content "sample response"
    }.to change(Response.all, :count).by(1)
  end
end
