# frozen_string_literal: true

require 'sequel/core'

namespace :db do
  desc 'Add extensions to the database'
  task add_extensions: :settings do
    Sequel.connect(ENV['DB_URL']) do |db|
      db.execute "CREATE EXTENSION citext;"
    end
  end
end
