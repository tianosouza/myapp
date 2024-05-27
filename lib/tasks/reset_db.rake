namespace :db do
  desc "Drop, create, migrate the database and seed it"
  task reset: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    puts "Database has been reset and migrated."
  end
end
