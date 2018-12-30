# Survey NPS

An extrictly educational microservice experiment using Ruby 2.6.0, [Grape](https://github.com/ruby-grape/grape), [Rack](http://rack.github.io/), Postgres, and ActiveRecord.

## How to use
1. Clone this repo.
2. Ensure you have Docker installed.
3. `cd nps-rb`.
4. `docker-compose up --build`
5. Wait a couple of seconds.
6. Go to your browser a type: `http://localhost:9292/api/v1/nps`

## TODO
- [ ] Add a Grape Entity, with an items wrapper, to each `score` resource.
- [ ] Paginate the `scores` resource.
- [ ] Sanitize the `score` creation endpoint.
- [ ] Cache the NPS per date.
- [ ] Add a `a month ago` attribute to NPS endpoint.
- [ ] Add tests: unit and integration.
