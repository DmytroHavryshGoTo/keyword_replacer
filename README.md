# KeywordReplacer [![Build Status](https://app.travis-ci.com/DmytroHavryshGoTo/keyword_replacer.svg?branch=main)](https://app.travis-ci.com/DmytroHavryshGoTo/keyword_replacer)

This gem allows you to replace specified keywords with the links in the text.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'keyword_replacer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install keyword_replacer

## Usage

```ruby
class Post < ActiveRecord::Base
  replaces_links method_name: :transformed_text, source: :text, custom_class: 'custom',
                 max_matches: -> { 10 },
                 keywords: -> { ['keyword_1'] },
                 keywords_with_links: -> { { 'keyword_1' => 'https://google.com' } }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DmytroHavryshGoTo/keyword_replacer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KeywordReplacer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/keyword_replacer/blob/master/CODE_OF_CONDUCT.md).
