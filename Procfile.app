web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: script/worker.sh
mailcatcher: bundle exec mailcatcher -f
