FROM ruby:3.0.0
RUN apt update -qq && apt install -y build-essential

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

EXPOSE 4567

CMD ["sh", "bin/setup.sh"]
