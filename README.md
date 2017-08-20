  * [![Build Status](https://travis-ci.org/amitizle/optio.svg?branch=master)](https://travis-ci.org/amitizle/optio)
  * [![Gem Version](https://badge.fury.io/rb/optio.svg)](https://badge.fury.io/rb/optio)

# Optio

A simple wrapper for Ruby's [OptionParser](https://ruby-doc.org/stdlib-2.4.1/libdoc/optparse/rdoc/OptionParser.html).
The aim of this library is to be able to use the powerful _OptionParser_ for it's most basic use, with an simpler
setup.
For things that are a bit more complicated than the very basic usage of options parsing for CLI tools, it's
probably better to use Ruby's _OptionParser_.


## Installation

```ruby
gem 'optio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optio

**Or**, install via [Rubygems](https://rubygems.org);

```
$ gem install optio
```
## Usage

The goal is to make the usage somehow similar to the _OptionParser_ one;

```ruby
require 'optio'

parsed = Optio::Parser.new do |parser|
  parser.switch :verbose, desc: "Verbose!", short: 'v', type: TrueClass
end.parse!
```

Where the types are the same ones that are specified [in here](https://ruby-doc.org/stdlib-2.4.1/libdoc/optparse/rdoc/OptionParser.html#class-OptionParser-label-Type+Coercion).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/optio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Optio project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/optio/blob/master/CODE_OF_CONDUCT.md).
