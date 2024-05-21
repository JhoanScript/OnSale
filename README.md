# OnSale

OnSale is a sales application developed with Rails. This app allows you to manage products, make sales, and track transactions.

## Deployment instructions

This project requires the following gems to get the server up and running:

Ruby version
- ruby (3.3.0)

System dependencies
- rails (7.1.3.3)
- puma (6.4.2)
- pg (1.5.6)
- rack (3.0.11)
- rackup (2.1.0)
- webrick (1.8.1)

Configuration
- Clone the repository.
- Run `bundle install` to install the project dependencies.

Database creation
- Run `rails db:create` to create the database.

Database initialization
- Run `rails db:migrate` to run the migrations and configure the database.
- Run `rails db:seed` to load the initial data.

Finally

- Run `rails server` to bring up the server.