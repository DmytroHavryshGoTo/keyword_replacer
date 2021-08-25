# frozen_string_literal: true

require 'support/activerecord'

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
    t.string :text
    t.boolean :bool
    t.timestamps
  end
end
