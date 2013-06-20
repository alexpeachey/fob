# Fob

Fob is a simple class you can subclass your Form Objects from. It includes ActiveModel and Virtus.

## Installation

Add this line to your application's Gemfile:

    gem 'fob'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fob

## Usage

    class MyForm < Fob::Fob
      represents :user, with: :username, :email
      has_one :company, with: :name
      attribute :remember_me, Boolean
      validates :username, presence: true
      validates :email, presence: true
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
