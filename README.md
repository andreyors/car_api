Test Project for Ally
=====================

# Description

I use Sinatra as base framework for API, DataMapper as ORM, Test-Unit for acceptance tests
For database - PostgreSQL with 'earthdistance' and 'cube' extensions to get ranged by distance collection.

DataMapper has strange issue which blocks us from importing data, solved with updating version from 2.0.0 to 2.1.2 https://goo.gl/a1hHea

# Installation notes

- Install gem dependency manager - `gem install bundler`
- Install PostgreSQL and pg extension
    - Mac OS X related
        - Use PostgresApp for Mac OS X http://postgresapp.com/
        - `sudo ARCHFLAGS="-arch x86_64" gem install pg -v '0.13.2'`
    - Linux related
        - Take a look on https://gorails.com/setup/ for Database Setup, we need to have PostGIS extensions cube and earthdistance
- Create database `createdb ally_development`
- Define environment variable - `export DB_DSN=postgres://localhost/ally_development`
- Install all gems `bundle install --binstubs`
- Inject PostGIS extensions to enable distance calculation - `rake udf`
- Insert demo data from data.json  - `rake init`
- Start web app - `rackup`
- Open in browser - "http://localhost:9292/cars?location=1,2"
- Run acceptance tests - `rake` (please, ensure that you started server)
- Run unit tests - `rake unit`

