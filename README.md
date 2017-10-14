# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails.

## Screenshots

!['Main Page'](https://raw.githubusercontent.com/rbarthel/jungle-rails/master/docs/main_page.jpeg)

!['Product Page'](https://raw.githubusercontent.com/rbarthel/jungle-rails/master/docs/product_page.jpeg)

!['Checkout Page'](https://raw.githubusercontent.com/rbarthel/jungle-rails/master/docs/checkout_page.jpeg)

!['Admin Product Control Page'](https://raw.githubusercontent.com/rbarthel/jungle-rails/master/docs/admin_product_page.jpeg)

## Getting Started

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Set admin credentials by assigning values to appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
Use any date in the future and 1111 for CVC code.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe