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

```ruby
class MyForm < Fob::Fob
  represents :user, with: :username, :email
  has_one :company, with: :name
  attribute :remember_me, Boolean
  validates :username, presence: true
  validates :email, presence: true
end
```

It supports saving and persistance checking based on your definition of saving.
The `save` method will yield the attributes hash to your provided block.
Your block should exit with true/false.

```ruby
MyForm.save |attributes|
  # Do some logic to save
  true
end
```

It supports checking uniqueness using the `uniqueness_on` validator.
To use the validator you must secify which class should be used to test for uniqueness.
The `exists?` method will be called on the class and is given a hash of the attribute name and value.
This should work as-is with an ActiveRecord model and is straightforward to implement on other class types.

```ruby
class MyForm < Fob::Fob
  represents :user, with: :username, :email
  has_one :company, with: :name
  attribute :remember_me, Boolean
  validates :username, presence: true
  validates :email, presence: true, uniqueness_on: { class_name: 'User' }
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
