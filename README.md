# NerdLog

Quick and dirty HTTP Wrapper around the WCL API

## Installation

Add this line to your application's Gemfile:

    gem 'nerd_log'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nerd_log

## Usage

Configure:

```rb
NerdLog.configure {|config| config.api_key = 'API KEY'}
```

Use:
```rb
report = NerdLog::Report.new(realm: 'anubarak', guild_name: 'Serenity')

reports = report.reports
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nerd_log/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
