# frozen_string_literal: true

require 'sequel/core'

namespace :db do
  desc 'Rollback migration'
  task :rollback, [:version] => :settings do |_task, args|
    Sequel.extension :migration

    @db = Sequel.connect(ENV['DB_URL'])

    args.with_defaults(version: @db[:schema_migrations].all[-2]&.dig(:filename) || 0)

    Sequel::Migrator.run(@db, 'db/migrations', target: args.version.to_i)

    Rake::Task['db:schema'].execute
    Rake::Task['db:version'].execute
  end
end
