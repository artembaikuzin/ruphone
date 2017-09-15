# Ruphone

Normalize russian phone numbers to +7XXXXXXXXXX format. Examples:

```ruby
Ruphone.normalize('8921-746-95-48')
# => "+79217469548"

Ruphone.normalize('8(921) 746-95-48')
# => "+79217469548"

Ruphone.normalize('746-95-48', city_code: '+7843')
# => "+78437469548"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruphone'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruphone
