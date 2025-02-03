require 'rails_helper'

RSpec.describe "投稿機能", type: :system do
  scenario "ユーザーは旅の記録を投稿できる" do
    user = FactoryBot.create(:user)
    sign_in user

    visit root_path
    click_link "旅の記録"

    expect {
      fill_in "タイトル", with: "沖縄旅行"
      fill_in "内容", with: "沖縄旅行よかったです。"
      fill_in "旅先", with: "沖縄"
      click_button "投稿"

      aggregate_failures do
        expect(page).to have_content "沖縄旅行"
        expect(page).to have_content "沖縄旅行よかったです。"
      end
    }.to change(user.posts, :count).by(1)
  end
end
