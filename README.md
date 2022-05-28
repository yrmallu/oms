# The Challenge

A company provides ecommerce shops (merchants) a flexible payment method so their customers (shoppers) can purchase and receive goods without paying upfront. The company earns a small fee per purchase and pays out (disburse) the merchant once the order is marked as completed.

The operations manager is now asking you to make a system to calculate how much money should be disbursed to each merchant based on the following rules:

Disbursements are done weekly on Monday.
We disburse only orders which status is completed.
The disbursed amount has the following fee per order:
1% fee for amounts smaller than 50 €
0.95% for amounts between 50€ - 300€
0.85% for amounts over 300€
We expect you to:

Create the necessary data structures and a way to persist them for the provided data. You don't have to follow our schema if you think another one suits better.
Calculate and persist the disbursements per merchant on a given week. As the calculations can take some time it should be isolated and be able to run independently of a regular web request, for instance by running a background job.
Create an API endpoint to expose the disbursements for a given merchant on a given week. If no merchant is provided return for all of them.
Find attached the merchants (https://www.dropbox.com/s/wms8dlqzs6bqkul/backend%20challenge%20dataset.zip?dl=0), shoppers and orders data on both json and csv files, use whatever it's easier for you. They follow this structure:

MERCHANTS
ID | NAME                      | EMAIL                             | CIF
1  | Treutel, Schumm and Fadel | info@treutel-schumm-and-fadel.com | B611111111
2  | Windler and Sons          | info@windler-and-sons.com         | B611111112
3  | Mraz and Sons             | info@mraz-and-sons.com            | B611111113
4  | Cummerata LLC             | info@cummerata-llc.com            | B611111114
SHOPPERS
ID | NAME                 | EMAIL                              | NIF
1  | Olive Thompson       | olive.thompson@not_gmail.com       | 411111111Z
2  | Virgen Anderson      | virgen.anderson@not_gmail.com      | 411111112Z
3  | Reagan Auer          | reagan.auer@not_gmail.com          | 411111113Z
4  | Shanelle Satterfield | shanelle.satterfield@not_gmail.com | 411111114Z
ORDERS
ID | MERCHANT ID | SHOPPER ID | AMOUNT | CREATED AT           | COMPLETED AT
1  | 25          | 3351       | 61.74  | 01/01/2017 00:00:00  | 01/07/2017 14:24:01
2  | 13          | 2090       | 293.08 | 01/01/2017 12:00:00  | nil
3  | 18          | 2980       | 373.33 | 01/01/2017 16:00:00  | nil
4  | 10          | 3545       | 60.48  | 01/01/2017 18:00:00  | 01/08/2017 15:51:26
5  | 8           | 1683       | 213.97 | 01/01/2017 19:12:00  | 01/08/2017 14:12:43


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

GET http://localhost:3000/disbursements

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
