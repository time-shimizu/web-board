require 'rails_helper'

RSpec.describe "Subcategories", type: :request do
  describe "GET /subcategories" do
    let!(:category) {create(:category)}
    let!(:subcategory1) {create(:subcategory, category: category)}
    let!(:subcategory2) {create(:subcategory, category: category)}
    let!(:topic1) {create(:topic, subcategories: [subcategory1])}
    let!(:topic2) {create(:topic, title: "title2", subcategories: [subcategory2])}

    before do
      get subcategory_path(subcategory1.id)
    end

    it "レスポンスが正しい" do
      expect(response).to have_http_status(200)
    end

    it "categoryが正しく表示される" do
      expect(response.body).to include category.content
    end

    it "subcategoryが正しく表示される" do
      expect(response.body).to include subcategory1.content
    end

    context "topicがsubcategory1に紐づいてる時" do
      it "topicが表示される" do
        expect(response.body).to include topic1.title
      end
    end

    context "topicがsubcategoryに紐づいていない時" do
      it "topicが表示されない" do
      expect(response.body).not_to include topic2.title
      end
    end
  end
end
