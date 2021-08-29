# frozen_string_literal: true

require 'sequel/core'

namespace :db do
  namespace :write_model do
    desc 'Rollback migration'
    task :rollback, [:version] => :settings do |_task, args|
      Sequel.extension :migration

      @db = Sequel.connect(ENV['WRITE_DB_URL'])

      args.with_defaults(version: @db[:schema_migrations].all[-2]&.dig(:filename) || 0)

      Sequel::Migrator.run(@db, 'db/write_db_migrations', target: args.version.to_i)

      Rake::Task['db:write_model:schema'].execute
      Rake::Task['db:write_model:version'].execute
    end
  end
end
