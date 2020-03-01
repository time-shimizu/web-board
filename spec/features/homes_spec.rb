require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  let!(:category)     {create(:category)}
  let!(:subcategory1) {create(:subcategory, category: category)}
  let!(:subcategory2) {create(:subcategory, category: category)}
  let!(:topic1)       {create(:topic, title: "foo", subcategories: [subcategory1])}
  let!(:topic2)       {create(:topic, title: "title2", subcategories: [subcategory2])}
  let!(:response1)    {create(:response, content: "foobar", topic: topic1)}
  let!(:response2)    {create(:response, content: "hogehoge", topic: topic1)}
  before do
    visit root_path
  end

  scenario "ヘルプページに正しく飛べる" do
    click_link "ヘルプ"
    expect(current_path).to eq help_path
  end

  scenario "ロゴのリンクが機能している" do
    click_link "11ちゃんねる"
    expect(current_path).to eq root_path
  end

  scenario "スレッド一覧に飛べる" do
    click_link "スレッド一覧"
    expect(current_path).to eq topics_path
  end

  scenario "サーチ機能が有効である" do
    fill_in "search", with: "foo"
    click_button "検索"
    expect(page).to have_content topic1.title
    expect(page).to have_content response1.content
    expect(page).not_to have_content topic2.title
    expect(page).not_to have_content response2.content
  end
end
