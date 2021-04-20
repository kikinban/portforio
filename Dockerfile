FROM ruby:2.6.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y  nodejs default-mysql-client yarn
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#     && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#     && apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs mysql-client \
#     && apt-get install -y nodejs yarn \
#     && mkdir /myapp
# WORKDIR /myapp
# COPY . /myapp

RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["sh","entrypoint.sh"]
EXPOSE 3000

#CMD ["rails", "server", "-b", "0.0.0.0"]