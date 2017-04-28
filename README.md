# PhoneParser

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/phone_parser`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

To parse phone numbers without an area code:

```ruby
PhoneParser.parse('555-555-5555') # => '5555555555'
PhoneParser.parse('5555555555') # => '5555555555'
PhoneParser.parse('(555) 555-5555') # => '5555555555'
PhoneParser.parse('555.555.5555') # => '5555555555'
PhoneParser.parse('555 555.5555') # => '5555555555'
PhoneParser.parse('555 555.5555') # => '5555555555'
```

It will throw an error if an invalid phone number is passed to the parser:

```ruby
PhoneParser.parse('5555555') # => PhoneLengthError
PhoneParser.parse('') # => PhoneLengthError
```

If a country code is supplied, the parser will verify that the code is valid, it will throw a `CountryCodeError` if the country code isn't valid:

```ruby
PhoneParser.parse('+15555555555') # => '15555555555'
PhoneParser.parse('1-7845555555555') # => '17845555555555'
PhoneParser.parse('Country Code: 379, Phone:  555-555-5555') # => '3795555555555'
PhoneParser.parse('3795555555555') # => '3795555555555'
PhoneParser.parse('999 555 555 5555') # => CountryCodeError
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/phone_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

