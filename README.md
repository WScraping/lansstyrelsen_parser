# Lansstyrelsen site parser

Article: [Make UpWork job for fun and free :) Parsing or Web Scraping](http://max-si-m.github.io/upwork-job-for-free)

Simple parser for Lansstyrelsen. Just for fun, maybe it will be helpful for someone :smile:

This parser made for [UpWork task](https://www.upwork.com/jobs/_~0138163c73e41f40a1/) and share for free.

## Usage

Very simple:

``` ruby
parser = Parsers::Lansstyrelsen.new(1000)
parser.get_all_pages
pp parser.data
```


## Contributing

1. Fork it ( https://github.com/WScraping/lansstyrelsen_parser )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
