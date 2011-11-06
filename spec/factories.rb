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

Factory.define :bullet_point do |bullet_point|
  bullet_point.header "Old Testament Israel Was Warned to Repent"
  bullet_point.bullet_point_content ""
  bullet_point.association :lesson
end

Factory.define :bible_verse do |bible_verse|
  bible_verse.label "Acts 11:18"
  bible_verse.verse_content "When they heard these things they became silent"
  bible_verse.association :bullet_point
end