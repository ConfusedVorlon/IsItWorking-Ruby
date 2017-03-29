# IsItWorking

https://IsItWorking.info provides a simple way for your code to check in and confirm that it is running!

This gem provides a simple wrapper for checking in, and timing code.

It's perfect for making sure that background tasks are running correctly, and for checking that they're not taking too long as your app grows.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'is_it_working_info'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install is_it_working_info

## Create a Checkin at IsItWorking.info

Log in to Is https://IsItWorking.info and create a 'Checkin'.

Click on the 'Use' button to get your CHECKIN_IDENTIFIER

## Usage

Send a simple checkin with

```ruby
IsItWorkingInfo::Checkin.ping(key:"CHECKIN_IDENTIFIER")
```

Send more info with optional methods:

```ruby
IsItWorkingInfo::Checkin.ping(key:"CHECKIN_IDENTIFIER",message:"Your Info",status:0,time:123, boundary:1000)
```

Time your code with:

```ruby
IsItWorkingInfo::Checkin.time(key:"CHECKIN_IDENTIFIER",message:"Is It Slow?", boundary:1000) do

	#Your Code Here

end
```
If your code takes longer than 1000 milliseconds to run, then that will trigger an error and IsItWorking will let you know.

See the full api details at https://isitworking.info/docs/checkin_api

## Configuration

You probably don't want your test/development code to be checking in.

You can disable the actual checkins with:

```ruby
IsItWorkingInfo.configure do |config|
	config.testing = true
end
```

If testing is true, then IsItWorkingInfo will `put` the url that it would have called, but won't actually do the checkin.

in Rails, you can disable for testing and development by adding an initialiser 

`/config/initializers/is_it_working_info.rb`

```ruby

IsItWorkingInfo.configure do |config|
	config.testing = Rails.env.test? || Rails.env.development?
end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/is_it_working.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).