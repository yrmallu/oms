# The Challenge

A company provides ecommerce shops (merchants) a flexible payment method so their customers (shoppers) can purchase and receive goods without paying upfront. The company earns a small fee per purchase and pays out (disburse) the merchant once the order is marked as completed.

The operations manager is now asking you to make a system to calculate how much money should be disbursed to each merchant based on the following rules:

* Disbursements are done weekly on Monday.
* We disburse only orders which status is completed.
* The disbursed amount has the following fee per order:
  * 1% fee for amounts smaller than 50 €
  * 0.95% for amounts between 50€ - 300€
  * 0.85% for amounts over 300€

## Prerequisites

1) `Ruby version > 2.7`
2) `Rails version  7`
3) `MySQL / PostgreSQL`
4) Redis


## Installation

1) `git clone ...`
2) `cd oms`
3) `change database.yml as per your database`
4) `bundle install`
5) `rake db:create`
6) `rake db:migrate`
7) `rails s`
8) start the `sidekiq` in different console

## API Endpoint

### To get disbursed amount for a given week for a merchant or all
GET http://localhost:3000/disbursements

### To get disbursed amount for a given week along with orders for a merchant or all
GET http://localhost:3000/disbursements?include=orders

Payload
```
    {
      "data": {
        "attributes": {
          "week": "Pass the week",
          "year": "Pass the year",
          "merchant_id": "Merchant ID is optional"
        }
      }
    }
```   

## Background cron job
`The cron job runs every monday at 5AM to process the disbursements for the week`

## Test

`bundle exec rspec`
