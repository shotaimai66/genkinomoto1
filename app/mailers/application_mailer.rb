class ApplicationMailer < ActionMailer::Base
  #送信元のメールアドレスを設定（envファイル作成要）
  default from: ENV["LOGIN_NAME"]
  layout 'mailer'
end
