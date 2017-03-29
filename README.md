# IsItWorking

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/is_it_working`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'is_it_working'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install is_it_working

## Create a Checkin at Is It Working

Log in to Is It Working and create a 'Checkin'.
Click on the 'Use' button to get your CHECKIN_IDENTIFIER

## Usage

Send a simple checkin with

```ruby
IsItWorking::Checkin.ping(key:"CHECKIN_IDENTIFIER")
```

Send more info with optional methods:

```ruby
IsItWorking::Checkin.ping(key:"CHECKIN_IDENTIFIER",message:"Your Info",status:0,time:123, boundary:1000)
```

Time your code with:

```ruby
IsItWorking::Checkin.time(key:"CHECKIN_IDENTIFIER",message:"Is It Slow?", boundary:1000) do

	#Your Code Here

end
```
If your code takes longer than 1000 milliseconds to run, then that will trigger an error and IsItWorking will let you know.

See the full api details at https://isitworking.info/docs/checkin_api

## Configuration

you can disable http calls with

```ruby
IsItWorking.configure do |config|
	config.testing = true
end
```

in Rails, you can disable for testing and development by adding an initialiser 

`/config/initializers/is_it_working.rb`

```ruby

IsItWorking.configure do |config|
	config.testing = Rails.env.test? || Rails.env.development?
end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/is_it_working.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

