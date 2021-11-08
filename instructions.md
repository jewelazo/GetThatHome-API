# Captone Project

## Before getting started

1. Clone this repo.

2. Rename `.env.sample` to `.env` and fill it up with your github credentials.

3. Run `docker compose up`.

4. On a different window run `docker compose exec client bash`.

5. Inside the bash terminal run the `bootstrap` command.


## About

### The app

You can access your running app looking at `localhost:3000`.

> To be able to see your app running on any browser, run it using `rails server -b 0.0.0.0`.
> Otherwise the server will start but you won't be able to see anything since the rails app is just showing for its local container.

### The database

The db host is your db container, it's name will be something like: `xxxx-xxxx_db_1`.

When you configure the db connection on rails, your `config/database.yml` file should look similar to the example below.

```ruby
default: &default
  adapter: postgresql
  encoding: unicode
  username: postgres
  password: <%= ENV['PGPASSWORD'] %>
  host: xxxx-xxxx_db_1
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
```

If you want to connect to your db from a GUI client, you can use the next credentials:

```
  username: postgres
  password: codeable
  host: localhost
  port: 54320
  database: <rails_db_dev_name>
```
