# frozen_string_literal: true

namespace :db do
  namespace :write_model do
    desc 'Prints current schema version'
    task version: :settings do
      Sequel.extension :migration

      @db = Sequel.connect(ENV['WRITE_DB_URL'])

      version = if @db.tables.include?(:schema_migrations)
                  @db[:schema_migrations].all.last&.dig(:filename) || "does not exist"
                end || 0

      puts "Last Migration: #{version}"
    end
  end
end
