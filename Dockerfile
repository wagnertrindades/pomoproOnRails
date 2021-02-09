FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

COPY . /pomoproOnRails
WORKDIR /pomoproOnRails

RUN gem install bundler -v 2.1.4
#RUN bundle update --jobs 3 --retry 3
RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
RUN bundle install --jobs 3 --retry 3
RUN bundle clean --force
RUN rake assets:precompile

ENV PORT 3000
EXPOSE $PORT

CMD ["rails", "server", "-b", "0.0.0.0"]
