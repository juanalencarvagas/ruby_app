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

## Potential Improvements
This application is reading files in a certain log format, if it needs to read files in other formats (eg json), changes in the reading class would be necessary.

Tests were made with a small base of logs, if there is a large number, other strategies such as storing data in a database will be necessary.




