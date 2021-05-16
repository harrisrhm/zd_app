## Zendesk Ticket Viewer


## Background and Objectives

Welcome to a CLI-based tool that allows you to view support tickets from Zendesk API account.

The app is really simple: my company needs a quick ticket viewer, but I need to retrieve all of the tickets from my account via API. It'll connect to the Zendesk API, request all the tickets for my account, diplay and paginate them in `list`, and `show` individual ticket details.


## Specs

The app follows as close to an MVC structure, although there is no database or repository involved. However, as the app grows, there is a room to incorporate such a need in the future.


### Programming language

The application and logic is entirely written in Ruby version 2.6.6, GEM libraries and no framework has been used.


### Model(Ticket)

I have defined `Ticket` class as the model. The idea is to basically initialize and define the states of the application with instance variables to be used throughout the application.


### Repository(ZendeskService)

The application does not have a proper database or repository yet, so it uses instead a ZendeskService class that handles API calls directly with the provider and temporarily persist the data on local. When a call is made via controller, the data will be retrieved with a basic authentication passes through an open-uri wrapper to enable successful response of '200' status code. Following the call, there will be two methods responsible to handle parsing, filtering of the hash object and paginate the response into small section of 25 results per page. 


### Controller

The controller will gather data from the ZendeskService to hand them over to the view. It will also ask the view for information to view all tickets and its' individual ticket details.


### View

The view is responsible for most of the `puts` and `gets` of the application MVC (except for error handling messages in other components especially the router).


### Router

The router is responsible for the other most of the `puts` and `gets` of the application. The biggest difference is that router in this instance project user action on the interface where as the view is an underlying layer that takes a call from the controller as well as router.


### App

I created an app.rb in lieu of a complete MVC model that uses a framework such as Rails for instance. So basically, the idea is to instantiate a `ZendeskService` and the `Controller`. It creates an infinite loop given in the `Router`. 


### Bringing it all together

When you are ready, you can test the program with:

1) Run bundle install

```bash
bundle install
```

2) 
```bash
ruby lib/app.rb
```

3) Enjoy and follow the prompt in the terminal


## Additional information


### Test

There are spec files I have written to test happy path. It is a very high level test that aims to ensure the application functions work as bare minimum. Test scope includes:

1) API connection
2) JSON parse
3) Instantiation and definition of classes


### Error handling

I have utilised `rescue` to handle error with looping and API calls. You will notice this in `display_all` in the view.rb and `ZendeskService.get_client` in the zendeskservice.rb


### GEM library

Below are the gems I have utilised:

--- gem "rake"
--- gem "rspec"
--- gem "open-uri"
--- gem "zendesk_api"
--- gem "kaminari"
--- gem "will_paginate"
--- gem "pagy"


