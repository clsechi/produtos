FROM ruby:2.3.3

RUN apt-get update -qq

RUN apt-get install -y --no-install-recommends nodejs

RUN mkdir -p /var/www/produtos

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --without test
RUN gem install bundler-audit

WORKDIR /var/www/produtos
ADD . /var/www/produtos
RUN cp config/products.yml.sample config/products.yml

run rake db:setup

EXPOSE 3001

CMD rails server --binding 0.0.0.0 --port 3001
