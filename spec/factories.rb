#By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                   "Perry Zheng"
  user.email                  "perryz@payscale.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :profile do |profile|
  profile.first_name "example"
  profile.last_name "user"
  profile.phone "917-518-5151"
  profile.esl true
  profile.country "China" 
  profile.start_date "2011-02-19"
  profile.end_date "2014-02-19"
  profile.english_help true
  profile.living_help false
  profile.fun_help true
  profile.notes "i want friends!"
  profile.association :user
end


