Welcome to Pomopro On Rails!
===================


This is the project Pomopro done in Ruby on Rails with the goal to do better free application for technique pomodoro.
And learn and practice Ruby on Rails.

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

----------

How to install project with Docker:
-------------

First you need have installed in your system:

>

> - Docker
> - Docker Compose

### Steps:
#### Make git clone

```
$ git clone https://github.com/wtrindades/pomoproOnRails.git
```

#### Run docker-compose build

```
$ cd pomoproOnRails/
$ docker-compose build
```

#### Run docker-compose up

Execute docker-compose up to run a docker image and rails server.

```
$ docker-compose up
```

#### Create and migrate the databases

Execute in other tab run this commands:

```
$ docker-compose run web rake db:create
$ docker-compose run web rake db:migrate
```

And access in your browser http://localhost:3000



