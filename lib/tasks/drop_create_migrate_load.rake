namespace :zubair do
  # one-step recreation of database
  desc "drop / create / migrate / load database. (params: language=es)"
  task(:setup) do
    Rake::Task["db:drop"].invoke
    puts "Database dropped ..."
    Rake::Task["db:create"].invoke
    puts "Database created ..."
    Rake::Task["db:migrate"].invoke
    puts "Schema created ..."
    language = (ENV['language'].blank? ? "en" : ENV['language'])
    Rake::Task["zubair:load"].invoke(language)
  end
end