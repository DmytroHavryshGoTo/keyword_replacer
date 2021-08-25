# frozen_string_literal: true

class Post < ActiveRecord::Base
  replaces_links method_name: :transformed_text, source: :text, custom_class: 'custom',
                 max_matches: -> { 4 },
                 keywords: -> { %w[test word foo] },
                 keywords_with_links: lambda {
                   { 'test' => 'http://test.com', 'word' => 'http://word.com', 'foo' => 'http://foo.com' }
                 }
  replaces_links method_name: :transformed_bool, source: :bool, custom_class: 'custom',
                 max_matches: -> { 4 },
                 keywords: -> { %w[test word foo] },
                 keywords_with_links: lambda {
                   { 'test' => 'http://test.com', 'word' => 'http://word.com', 'foo' => 'http://foo.com' }
                 }
end
