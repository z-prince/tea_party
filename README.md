# Tea Party Back End Database
Tea Party is a blazingly fast tea subscription API that provides tea entrepreneurs an opportunity to track and manage their user's subscription information.

Using service test driven development I created this API to be reliable so you can worry about getting your tea to your loyal customers, not about whether or not your data is secure.

![tea_party_diagram](https://user-images.githubusercontent.com/65498038/190652912-260c6b59-a372-4046-9565-2dcbc10417d3.png)

## Table of Contents
* [Getting Started](#getting-started)
* [API Endpoints](#api-endpoints)
  * [Subscription Endpoints](#subscription-endpoints)
* [Local Hosting](#local-hosting)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)

<a name="getting-started"></a>
## Getting Started
Thanks for checking out Tea Party! There are a few ways to access and manipulate data through our API endpoints and a few technologies we used to develop our project. 

<a name="api-endpoints"></a>
## API Endpoints

<a name="subscription-endpoints"></a>
### Subscription Endpoints
* *post* /api/vi/subscriptions
  
  ```
  {
    "customer_id": 1,
    "subscription_id": 1,
    "tea_id": 1
  } 
  # Adds a subscription to a tea for specified customer.
  ```
* *patch* /api/vi/subscriptions
  
  ```
  {
    "customer_id": 1,
    "subscription_id": 1,
  } 
  # Cancels a subcsription for specified customer.
  ```
* *get* /api/vi/customer_subscriptions
  
  ```
  {
    "customer_id": 1
  } 
  # Returns all subscriptions for specified customer, cancelled and active.
  ```
<a name="local-hosting"></a>
## Local Hosting

In order to host this API locally you will need to configure your development environment appropriately.

<a name="prerequisites"></a>
### Prerequisites

Tea Party was developed in Rails 5.2.8.1 (it is recommended to use either this version or a newer version of rails within Rails 5) and Ruby version 2.7.4.

To verify your version of Ruby and Rails run the following commands from your command line:

```
$ ruby -v!

$ ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [arm64-darwin21]
$ rails -v
$ Rails 5.2.8.1
```
If you do not have Ruby installed please visit the Ruby docs [here](https://www.ruby-lang.org/en/documentation/installation/).

If you also need Rails please visit the Rails documentation site [here](https://guides.rubyonrails.org/v5.0/getting_started.html).

<a name="installation"></a>
### Installation

Open your terminal and run these commands:

* `gem install bundler`
* `git clone https://github.com/z-prince/tea_party`
* `bundle install`
* `rails db:{drop,create,migrate,seed}`

Due to the fact that this will be a local consumption, all endpoints you consume will start with `http://localhost:3000` by default unless specified otherwise.

Now that everything is properly configured on your local machine, run `rails s` in your terminal to start the server and get consuming!
