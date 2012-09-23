# Predicates

[Predicates](http://erol.github.com/predicates) are truth accessors for your Ruby classes and models. Yep, that's about it.

## Usage

Extend your class or model with Predicates and define the predicate by supplying an attribute:

    require 'predicates'

    class User
      extend Predicates

      attr_accessor :confirmed
      predicate :confirmed?
    end

    user = User.new
    user.confirmed = 1
    user.confirmed? #=> true

Predicates will also create an attribute writer for you using `attr_writer` if the attribute you supplied has not been predefined.

    class User
      extend Predicates

      predicate :confirmed?
    end

    user = User.new
    user.confirmed = 1
    user.confirmed? #=> true

## Installation

Add this line to your application's Gemfile:

    gem 'predicates'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install predicates

## Contributing

1. Fork it
2. Create your feature branch ( `git checkout -b my-new-feature` )
3. Create tests and make them pass ( `rake test` )
4. Commit your changes ( `git commit -am 'Added some feature'` )
5. Push to the branch ( `git push origin my-new-feature` )
6. Create a new Pull Request
