task :create_users => :environment do
  User.create(name: "user1", email: "user1@mail.ru", :alias => "alias1", password:"12345678")
  User.create(name: "user2", email: "user2@mail.ru", :alias => "alias2", password:"12345678")
  User.create(name: "user3", email: "user3@mail.ru", :alias => "alias3", password:"12345678")
  User.create(name: "user4", email: "user4@mail.ru", :alias => "alias4", password:"12345678")
  User.create(name: "user5", email: "user5@mail.ru", :alias => "alias5", password:"12345678")
  User.create(name: "user6", email: "user6@mail.ru", :alias => "alias6", password:"12345678")
  User.create(name: "user7", email: "user7@mail.ru", :alias => "alias7", password:"12345678")
  User.create(name: "user8", email: "user8@mail.ru", :alias => "alias8", password:"12345678")
  User.create(name: "user9", email: "user9@mail.ru", :alias => "alias9", password:"12345678")
  User.create(name: "user10", email: "user10@mail.ru", :alias => "alias10", password:"12345678")
  User.create(name: "user11", email: "user11@mail.ru", :alias => "alias11", password:"12345678")
  User.create(name: "user12", email: "user12@mail.ru", :alias => "alias12", password:"12345678")
end
