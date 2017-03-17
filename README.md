# LfoApi

LfoApi is a Ruby gem that wraps the hypothetical API for Leapfrog Online. While it is not published, this is my solution to the given challenge. The gem is meant to run locally.

Because it is hypothetical, there were additional support files added to make tests work. They are meant to be reviewed.

## Local Development

Clone the repo, and run `bin/setup` to install dependencies. To run tests, run `rake spec`. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

Dependencies installed include: bundler, rake, rspec, webmock, sinatra, faraday and json.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lfo_api'
```

And then execute:

    $ bundle


## Usage

```ruby
# Create customer for API requests
@customer = LfoApi::Customer.new
# Get scoring advice for specific customer. Replace hypothetical URL with the working version.
@customer.get_scoring_advice('http://not_real.com/customer_scoring?income=50000&zipcode=60201&age=35')
# Get customer's propensity
@customer.propensity # => 0.26532
# Get customer's ranking
@customer.ranking # => "C"
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

