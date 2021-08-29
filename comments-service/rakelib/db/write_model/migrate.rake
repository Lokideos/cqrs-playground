# frozen_string_literal: true

require 'sequel/core'

namespace :db do
  namespace :write_model do
    desc 'Run database migrations'
    task :migrate, %i[version] => :settings do |t, args|
      Sequel.extension :migration

      Sequel.connect(ENV['WRITE_DB_URL']) do |db|
        migrations = File.expand_path('../../../db/write_db_migrations', __dir__)
        version = args.version.to_i if args.version

        Sequel::Migrator.run(db, migrations, target: version)
      end
      Rake::Task['db:write_model:schema'].execute
      Rake::Task['db:write_model:version'].execute
    end
  end
end
