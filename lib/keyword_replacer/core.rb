# frozen_string_literal: true

module KeywordReplacer
  # Replacing core
  class Core < Module
    def initialize(options = {})
      include InstanceMethods

      define_method options[:method_name] do
        @options = Hash.new(0)
        @removed_links = {}
        @max_matches = options[:max_matches].call
        @keywords = options[:keywords].call
        @keywords_with_links = options[:keywords_with_links].call
        @keywords_matcher = Regexp.new('(' + keywords.join('|') + ')', Regexp::IGNORECASE)
        paste_links replace_keywords replace_links send(options[:source])
      end
    end

    # Instance methods
    module InstanceMethods
      private

      attr_accessor :removed_links, :options
      attr_reader :keywords, :keywords_with_links, :keywords_matcher, :max_matches

      def replace_links(target)
        target.to_s.gsub(%r{(<a).*?(\/a>)}) do |match|
          key = SecureRandom.hex
          removed_links[key] = match
          key
        end
      end

      def paste_links(target)
        reverse_links_matcher = Regexp.new('(' + removed_links.keys.join('|') + ')')
        target.gsub(reverse_links_matcher) do |match|
          removed_links[match]
        end
      end

      def replace_keywords(target)
        target.gsub(keywords_matcher) do |match|
          if options[match] >= 2 || options.sum { |_, v| v } >= max_matches
            match
          else
            options[match] += 1
            keyword_link = keywords_with_links[match.downcase]
            "<a target='_blank' class='custom' href='#{keyword_link}' >#{match}</a>"
          end
        end
      end
    end
  end
end
