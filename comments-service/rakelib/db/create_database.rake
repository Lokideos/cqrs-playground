# frozen_string_literal: true

require 'sequel/core'

namespace :db do
  desc 'Create database'
  task create: :settings do
    Sequel.connect(ENV['DB_URL']) do |db|
      db.execute "CREATE DATABASE #{ENV.fetch('DB_NAME')}"
    end
  end
end
