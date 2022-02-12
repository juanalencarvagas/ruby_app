# RubyApp

This app has the intention to open a log as argument (webserver.log is provided)

Returns the following:
list of webpages with most page views ordered from most pages views to less page views
e.g.:
/about/2 8 unique views
/index 5 unique views etc...

## Installation

execute:

    $ bundle install

## Usage

To run this app

```ruby
ruby app/parser.rb '<name-of-the-file>'

ex.: ruby app/parser.rb 'webserver.log'
```


