# README

* Ruby version

    ruby 2.5.0

* Install dependencies

    bundle install

* Initialize database

    bundle exec rake db:setup

* To run the test suite

    bundle exec rspec

* Deployed API
    https://todoist-dev.herokuapp.com/api/v1

* API Docs
    https://todoist-dev.herokuapp.com/api-docs/index.html
   
* Test API

    Calling the API using https://httpie.org/.
    - Create a Todo 

        http POST https://todoist-dev.herokuapp.com/api/v1/todos description='Integration Testing'

    - Update a Todo

        http PUT https://todoist-dev.herokuapp.com/api/v1/todos/1 completed=false

        http PUT https://todoist-dev.herokuapp.com/api/v1/todos/1 completed=true

        http PUT https://todoist-dev.herokuapp.com/api/v1/todos/1 description='Integration Testing WIP' completed=false

        http PUT https://todoist-dev.herokuapp.com/api/v1/todos/1 description='Integration Testing WIP' completed=true completed_at=2019-08-06

    - List of all Todo 

        http https://todoist-dev.herokuapp.com/api/v1/todos






