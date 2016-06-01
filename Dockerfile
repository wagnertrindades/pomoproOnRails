# sudo docker build -t "wagnertrindade/pomopro:latest" -f docker-images/promopro-dev .
FROM rails:4.2.6

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y libicu-dev \
    && apt-get install -y nodejs --no-install-recommends

COPY Gemfile ./Gemfile

RUN bundle install
