require 'rails_helper'

RSpec.feature "Authentications", type: :feature do
  let!(:user)  {create(:user)}
  let!(:topic) {create(:topic)}

  before do
    visit root_path
  end

  scenario "ログインしてない時、新規スレッド作成ページに行くとログインページに飛ぶ" do
    click_link "新しいスレッドをたてる"
    expect(current_path).to eq new_user_session_path
  end

  scenario "ログインしてない時、topicページに返信フォームが存在しない" do
    visit topic_path(topic.id)
    expect(page).to have_content topic.content
    expect(page).to have_content "返信する"
  end
end
