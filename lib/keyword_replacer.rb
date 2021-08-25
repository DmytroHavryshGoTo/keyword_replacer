# frozen_string_literal: true

require 'keyword_replacer/version'
require 'active_record'
require 'keyword_replacer/core'

module KeywordReplacer
  class TypeError < StandardError; end

  def replaces_links(options)
    include KeywordReplacer::Core.new(options)
  end
end

ActiveRecord::Base.extend KeywordReplacer
