# SaaS Solution for Shipment Management

This project is a SaaS (Software as a Service) solution for managing shipments. It allows customers to create shipments by providing source and target locations along with shipment metadata. Delivery partners can view assigned shipments and update their status. As a SaaS provider, you can on-board and off-board customers and delivery partners.

## Technologies Used

- Ruby on Rails v7
- PostgreSQL
- Hotwire Turbo
- Stimulus.js
- Bootstrap (for CSS)

## Features

- User authentication and authorization
- On-boarding and off-boarding of customers and delivery partners
- Creation, viewing, updating, and deleting shipments by customers
- Viewing and updating shipment status by delivery partners
- Logging for API actions
- Responsive web design using Bootstrap

## Setup

1. Clone the repository:
```ruby
 git clone <repository_url>
```

2. Install dependencies:
```ruby
 bundle install
```

3. Set up the database:
```ruby
rails db:create
rails db:migrate
```

4. Run the Rails server:
```ruby
rails server
```

5. Access the application in your browser at
```ruby
development - http://localhost:3000
```
```ruby
production - https://saas-shipment-app.onrender.com
```


## Usage

- Log in as a customer to create shipments and manage them.
- Log in as a delivery partner to view and update shipment status.
- Log in as an admin to on-board or off-board users.

## Deployment

To deploy the application to production, follow these steps:

1. Set up your production environment, including configuring the database and web server.
2. Precompile assets for production:

RAILS_ENV=production rails assets:precompile


3. Set up any environment variables needed for production.
4. Deploy the application to your server.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



