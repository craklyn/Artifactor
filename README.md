1. Install [Homebrew](http://brew.sh/)

        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

2. Update [Homebrew](http://brew.sh/)

        brew update

3. Install [PostgreSQL](http://www.postgresql.org/download/)

        brew install postgres

4. Install [Redis](http://redis.io/)

        brew install redis

5. Install [ImageMagick](http://www.imagemagick.org/)

        brew install imagemagick

6. Install [Qt](http://www.qt.io/)

        brew install qt

7. Install the [Heroku Toolbelt](https://toolbelt.heroku.com/)

        brew install heroku-toolbelt

#### Installing the Ruby dependencies

1. Install [chruby](https://github.com/postmodern/chruby#readme)

        brew install chruby

2. Configure [chruby](https://github.com/postmodern/chruby#readme)

        echo 'source /usr/local/share/chruby/chruby.sh' >> ~/.bash_profile
        echo 'source /usr/local/share/chruby/auto.sh' >> ~/.bash_profile
        source ~/.bash_profile

3. Install [ruby-install](https://github.com/postmodern/ruby-install#readme)

        brew install ruby-install

4. Install [Ruby](https://www.ruby-lang.org/en/)

        ruby-install ruby 2.2.2

5. Configure a default [Ruby](https://www.ruby-lang.org/en/)

        echo '2.2.2' >> ~/.ruby-version

#### Installing the application dependencies

1. Clone the repository

        git clone https://....git

2. Change the working directory

        cd ......

3. Install [Bundler](http://bundler.io/)

        gem install bundler

4. Install the gem dependencies

        bundle install --path vendor/bundle --without production staging

5. Stop any postgres services

        `ps aux | grep postgres`

  If postgres is running from brew: `brew services stop postgresql`

6 Create a Postgres database

        pg_ctl init -D db/postgres
        OR
        /usr/lib/postgresql/9.3/bin/initdb -D db/postgres

7. Create a Redis directory

        mkdir db/redis

#### Configuring the application

1. Create and edit `config/database.yml`

        cp config/database.yml.example config/database.yml


#### Seeding the database

1. Launch the system services

        bundle exec foreman start -f Procfile.sys

#### Launching the application

1. Launch the application services

        bundle exec foreman start -f Procfile.app

2. Visit the web application

        open http://0.0.0.0.xip.io:5000

3. Visit the mailcatcher application

        open http://localhost:1080
