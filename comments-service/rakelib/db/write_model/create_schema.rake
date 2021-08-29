# frozen_string_literal: true

namespace :db do
  namespace :write_model do
    desc 'Create db schema'
    task schema: :settings do
      schema_location = "db/write_db_schema.rb"
      system("sequel -D #{ENV['WRITE_DB_URL']} > #{schema_location}")
    end
  end
end
