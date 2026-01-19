
FROM ruby:3.2-slim AS base

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=true \
    BUNDLE_PATH=/bundle \
    BUNDLE_WITHOUT="development test"

# ---- System dependencies ----
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  libyaml-dev \
  nodejs \
  git \
  curl \
  && rm -rf /var/lib/apt/lists/*

RUN corepack enable && corepack prepare yarn@stable --activate

WORKDIR /app

# ---- Install gems ----
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# ---- Copy app code ----
COPY . .

# ---- Precompile bootsnap (optional but good) ----
RUN bundle exec bootsnap precompile --gemfile

# ---- Expose port ----
EXPOSE 3000

# ---- Start Rails with Puma ----
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

