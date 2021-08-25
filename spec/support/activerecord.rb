# frozen_string_literal: true

require 'active_record'

ActiveRecord::Base.establish_connection({ adapter: 'sqlite3', database: ':memory:' })
ActiveRecord::Migration.verbose = false
