namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    50.times do 
      User.all(:limit => 6).each do |user|
        user.microposts.create!(:content => Faker::Lorem.sentence(5))
      end
    end
    
    10.times do
      Lesson.create!(:title => Faker::Lorem.sentence(2),
                     :lesson_content => Faker::Lorem.sentence(5))
    end
    
    50.times do
      Lesson.all(:limit => 6).each do |lesson|
        lesson.bullet_points.create!({:header => Faker::Lorem.sentence(2)})
      end
    end
    
    3.times do 
      BulletPoint.all(:limit => 100).each do |bullet_point|
        bullet_point.bible_verses.create!( {:label => Faker::Lorem.sentence(1),
                                            :verse_content => Faker::Lorem.sentence(3)})
      end
    end
    
  end
end
