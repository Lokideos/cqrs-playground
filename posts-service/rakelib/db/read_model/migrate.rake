# frozen_string_literal: true

require 'sequel/core'

namespace :db do
  namespace :read_model do
    desc 'Run database migrations'
    task :migrate, %i[version] => :settings do |t, args|
      Sequel.extension :migration

      Sequel.connect(ENV['READ_DB_URL']) do |db|
        migrations = File.expand_path('../../../db/read_db_migrations', __dir__)
        version = args.version.to_i if args.version

        Sequel::Migrator.run(db, migrations, target: version)
      end
      Rake::Task['db:read_model:schema'].execute
      Rake::Task['db:read_model:version'].execute
    end
  end
end
