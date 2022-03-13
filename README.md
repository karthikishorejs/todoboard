# Todoboard

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.2]
- Rails [6.1.4.7]

## Install
##### 1. Check out the repository

```bash
git@github.com:karthikishorejs/todoboard.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

## Tests
##### Rspec test

Tests can be executed using the command below 

```ruby
RAILS_ENV=test rspec
```