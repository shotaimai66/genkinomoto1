class ApplicationMailer < ActionMailer::Base
  #送信元のメールアドレスを設定（envファイル作成要）
  # default from: ENV["LOGIN_NAME"]
  default from: "motorsports46animals@gmail.com" #テスト用アドレスなので、本番では変更要(envファイルにて再設定してください）。
  layout 'mailer'
end
