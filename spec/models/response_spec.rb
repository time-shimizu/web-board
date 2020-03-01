require 'rails_helper'

RSpec.describe Response, type: :model do
  let(:response) {create(:response)}

  context "user_name contentがある時" do
    it "topicは有効である" do
    expect(response).to be_valid
    end
  end

  context "user_nameがnilの時" do
    it "バリデーションにかかる" do
    response.user_name = nil
    response.valid?
    expect(response.errors[:user_name]).to include "を入力してください"
    end
  end

  context "contentがnilの時" do
    it "バリデーションにかかる" do
    response.content = nil
    response.valid?
    expect(response.errors[:content]).to include "を入力してください"
    end
  end
end
