# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if(User.all.count == 0)
  User.create(:email => 'codex9394@hotmail.com', :password => 'testing123',:password_confirmation => 'testing123', :admin_flag => true)
  User.create(:email => 'psychprotect@hotmail.com', :password => 'trueblue',:password_confirmation => 'trueblue', :nick_name => 'True Blu', :first_name => 'Peter', :last_name => 'Khnana', :admin_flag => true)
end