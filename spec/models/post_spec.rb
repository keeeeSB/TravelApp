require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.create(:post) }

  it "ファクトリーが正常に動く" do
    expect(FactoryBot.build(:post)).to be_valid
  end

  describe "バリデーションのテスト" do
    it "タイトルは必須である" do
      post.title = " "
      expect(post).to_not be_valid
    end

    it "内容は必須である" do
      post.body = " "
      expect(post).to_not be_valid
    end

    it "旅先は必須である" do
      post.location = " "
      expect(post).to_not be_valid
    end
  end
end
