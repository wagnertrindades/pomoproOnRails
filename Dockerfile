FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

COPY . /pomoproOnRails
WORKDIR /pomoproOnRails

RUN gem install bundler -v 1.17.3 && bundle install --jobs 3 --retry 3
RUN bundle clean --force
RUN rake assets:precompile

ENV PORT 3000
EXPOSE $PORT

CMD ["rails", "server", "-b", "0.0.0.0"]
