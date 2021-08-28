# frozen_string_literal: true

namespace :db do
  desc 'Create db schema'
  task schema: :settings do
    schema_location = "db/schema.rb"
    system("sequel -D #{ENV['DB_URL']} > #{schema_location}")
  end
end
