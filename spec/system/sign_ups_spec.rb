require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  include ActiveJob::TestHelper

  scenario "ユーザーは新規登録ができ、アカウント承認用のメールが送信される" do
    visit root_path
    click_link "新規登録"

    fill_in "お名前", with: "テストユーザー"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード再確認", with: "password"
    click_button "登録"

    expect(page).to \
      have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"
    expect(current_path).to eq root_path

    mail = ActionMailer::Base.deliveries.last

    aggregate_failures do
      expect(mail.to).to eq [ "test@example.com" ]
      expect(mail.from).to eq [ "travel_app@example.com" ]
      expect(mail.subject).to eq "メールアドレス確認メール"
      expect(mail.body).to match "メールアドレスの確認"
    end
  end
end
