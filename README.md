Welcome to Pomopro On Rails!
===================


This is the project Pomopro done in Ruby on Rails with the goal to learn and practice Ruby on Rails.

It's hosted in url below:

http://pomopro.herokuapp.com/

----------


How to install project in localhost:
-------------

First you need have installed in your system:

> 

> - Ruby 2.2.3
> - Ruby on Rails 4
> - Postgres 9.5
> - Git

### Steps:
#### Make git clone

```
$ git clone https://github.com/wtrindades/pomoproOnRails.git
```

#### Install gems in project

```
$ cd pomoproOnRails/
$ bundle install
```

#### Create and migrate database

```
$ rake db:create
$ rake db:migrate
```

#### Start server

```
$ rails s
```
And access in your browser http://localhost:3000
