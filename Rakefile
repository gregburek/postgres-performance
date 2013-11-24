require "bundler"
Bundler.setup
require 'pg'
require 'queue_classic'
require 'queue_classic/tasks'

namespace :generate do
  desc 'Make a new migration file'
  task :migration do
    filename = "./migrations/#{Time.now.strftime "%Y%m%d%H%M%S"}_#{ENV['name'] || 'new_migration'}.rb"
    File.open(filename, 'w') do |file|
      file << <<-FILE
Sequel.migration do
  up do

  end

  down do

  end
end
FILE
    end
    puts "Added #{filename}"
  end
end

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    require 'logger'
    require 'sequel'
    require 'sequel/extensions/migration'
    database_url = ENV['DATABASE_URL'] || 'postgres:///shogun'
    target_version = ENV['VERSION'].to_i if ENV['VERSION']
    DB = Sequel.connect(database_url, loggers: Logger.new(STDOUT))
    Sequel::Migrator.apply(DB, 'migrations', target_version)
  end
end
