require 'faker'

namespace :db do
  desc "fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Mat Rix",
                 :email => "mat.rix@wp.pl",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    User.create!(:name => "Example User",
                 :email => "example@company.com",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@company.com"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end


end