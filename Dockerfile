FROM ruby:3.4-slim

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    libpq-dev \
    libyaml-dev \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local deployment true && \
    bundle config set --local without 'development test' && \
    bundle install

COPY . .

RUN bundle exec rails assets:precompile SECRET_KEY_BASE=dummy

EXPOSE 3000

CMD ["bundle", "exec", "thrust", "bin/rails", "server", "-b", "0.0.0.0"]
