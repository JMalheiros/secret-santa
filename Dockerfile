FROM ruby:3.1.2

ENV BUNDLER_VERSION=2.3.19

RUN apt-get update && apt-get install -y \
        curl \
        git \
        build-essential \
        libpq-dev &&\
        curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
        apt-get update && apt-get install -qq -y nodejs yarn

RUN gem install bundler -v 2.3.19

WORKDIR /app

COPY Gemfile  Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY yarn.lock ./

RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
