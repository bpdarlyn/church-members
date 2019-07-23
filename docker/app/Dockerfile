#Dockerfile
FROM ruby:2.6.2

# Install Necesary packages to rails
RUN apt-get update -qq && \
    apt-get install -y apt-utils build-essential libpq-dev sqlite3 ghostscript

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

RUN node -v
RUN npm -v

# Work Directory
ARG RAILS_ROOT
RUN mkdir ${RAILS_ROOT}
WORKDIR ${RAILS_ROOT}

# Install Dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

RUN npm install -g yarn
RUN yarn install
# Copy Files
COPY . .
