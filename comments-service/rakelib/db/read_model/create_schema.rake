# frozen_string_literal: true

namespace :db do
  namespace :read_model do
    desc 'Create db schema'
    task schema: :settings do
      schema_location = "db/read_db_schema.rb"
      system("sequel -D #{ENV['READ_DB_URL']} > #{schema_location}")
    end
  end
end
