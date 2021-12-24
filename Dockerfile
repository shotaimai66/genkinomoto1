FROM ruby:3.0.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  imagemagick \
  build-essential \
  libpq-dev \
  postgresql-client \
  vim

# 変更予定
RUN apt-get update && apt-get install -y unzip && \
  CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
  wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
  unzip ~/chromedriver_linux64.zip -d ~/ && \
  rm ~/chromedriver_linux64.zip && \
  chown root:root ~/chromedriver && \
  chmod 755 ~/chromedriver && \
  mv ~/chromedriver /usr/bin/chromedriver && \
  sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
  sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
  apt-get update && apt-get install -y google-chrome-stable

# 変更前
# WORKDIR /app
# COPY Gemfile Gemfile.lock /app/
# RUN bundle install

# 変更予定
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# アプリケーションコードのコピー
COPY . /app

#今井さんからのアドバイスでコメントアウト
# COPY start.sh /start.sh
# RUN chmod 744 /start.sh
# CMD ["sh", "/start.sh"]

# アセットのプリコンパイル
RUN SECRET_KEY_BASE=placeholder bundle exec rails assets:precompile \
 && yarn cache clean \
 && rm -rf node_modules tmp/cache

# 今井さんからのアドバイスで本番環境用に追加
# ランタイム設定
ENV RAILS_SERVE_STATIC_FILES="true"
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
