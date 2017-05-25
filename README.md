# PhoneParser

A phone parsing gem that takes in phone numbers and removes any formatting to ensure uniform phone numbers. It also includes a country code validation component.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'phone_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phone_parser

## Usage

To parse phone numbers without a country code, a default country code of `1` is assumed:

```ruby
PhoneParser.parse('555-555-5555')   # => '15555555555'
PhoneParser.parse('5555555555')     # => '15555555555'
PhoneParser.parse('(555) 555-5555') # => '15555555555'
PhoneParser.parse('555.555.5555')   # => '15555555555'
PhoneParser.parse('555 555.5555')   # => '15555555555'
PhoneParser.parse('555 555.5555')   # => '15555555555'
```

It will throw an error if an invalid phone number is passed to the parser:

```ruby
PhoneParser.parse('5555555') # => PhoneLengthError
PhoneParser.parse('')        # => PhoneLengthError
```

If a country code is supplied, the parser will verify that the code is valid, it will throw a `CountryCodeError` if the country code isn't valid:

```ruby
PhoneParser.parse('+15555555555')                            # => '15555555555'
PhoneParser.parse('1-7845555555555')                         # => '17845555555555'
PhoneParser.parse('Country Code: 379, Phone:  555-555-5555') # => '3795555555555'
PhoneParser.parse('3795555555555')                           # => '3795555555555'
PhoneParser.parse('999 555 555 5555')                        # => CountryCodeError
```

If you want to supply a different default country code, you can pass in an optional argument, this will not override country codes found in the provided number, it will only be used if a country code is not found.

```ruby
PhoneParser.parse('5555555555', country_code: '379') # => '3795555555555'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/phone_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

