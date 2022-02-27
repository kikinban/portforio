FROM ruby:2.6.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y  nodejs default-mysql-client yarn
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール
RUN mkdir /myapp
# コンテナ内にmyappディレクトリを作成apt
WORKDIR /myapp
# 作成したmyappディレクトリを作業用ディレクトリとして設定
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー
RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install
COPY . /myapp
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー

# mariadb-clientのインストール
RUN apt install mariadb-client-core-10.3


RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["sh","entrypoint.sh"]
EXPOSE 3000

#CMD ["rails", "server", "-b", "0.0.0.0"]
