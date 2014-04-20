# Tusker

A command line interface to connect with and use Evernote.

## Installation

Add this line to your application's Gemfile:

    gem 'tusker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tusker

## Setup

### Current Caveats

- Has only been run on `ruby 2.1.1`.
- Works on a Mac, and I presume Linux, machine.
- Only works with sandboxed developer tokens.
    - You can obtain one from here: [https://sandbox.evernote.com/api/DeveloperToken.action](https://sandbox.evernote.com/api/DeveloperToken.action)
- Much lacking, so alpha.

## Usage

### To list Notebooks:
```
# in irb, pry, etc

> require 'tusker'
> Tusker.add_token(developer_token)
> Tusker.notebooks
# ===> ["thewatts' notebook"]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tusker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
