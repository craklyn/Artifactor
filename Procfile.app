web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
mailcatcher: bundle exec mailcatcher -f
