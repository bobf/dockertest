FROM ruby:2.6.3
RUN mkdir /myapp
WORKDIR /myapp
RUN gem install bundler:2.0.1
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install
RUN apt-get update && apt-get install -y nodejs
COPY . /myapp

ENV RAILS_ENV=development
ENV RAILS_LOG_TO_STDOUT=1
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
