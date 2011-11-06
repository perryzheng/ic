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

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end

Factory.define :lesson do |lesson|
  lesson.lesson_content "Turning from a life of sin to serve God.."
  lesson.title "Repentance From Dead Works"
end