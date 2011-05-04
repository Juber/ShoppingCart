require File.join(File.dirname(__FILE__), 'load_test_user.rb')
require File.join(File.dirname(__FILE__), 'load_test_data.rb')


namespace :zubair do
  desc "Insert static data into the database.  (params: language=es)"
  task(:load => :environment) do
    puts "environment = #{RAILS_ENV}"
    language = (ENV['language'].blank? ? "en" : ENV['language'])
    puts "language = #{language}"
    puts "load_test_user                 ";   load_test_user
    puts "load_test_data                   ";   load_test_data
  end

end
