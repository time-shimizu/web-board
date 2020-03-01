require 'rails_helper'

RSpec.describe Topic, type: :model do
  let!(:topic) {create(:topic)}
  let!(:new_topic) {create(:topic)}
  context "title contentがある時" do
    it "topicは有効である" do
    expect(topic).to be_valid
    end
  end

  context "titleがnilの時" do
    it "バリデーションにかかる" do
    topic.title = nil
    topic.valid?
    expect(topic.errors[:title]).to include "を入力してください"
    end
  end

  context "contentがnilの時" do
    it "バリデーションにかかる" do
    topic.content = nil
    topic.valid?
    expect(topic.errors[:content]).to include "を入力してください"
    end
  end

  it "遅くできたtopicが上に表示される" do
    expect(Topic.first).to eq new_topic
  end
end
