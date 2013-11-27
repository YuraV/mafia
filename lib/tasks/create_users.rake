task :create_users => :environment do
  User.create(name: "yura", email: "yura@mail.ru", :alias => "provokator", password:"12345678")
  User.create(name: "Rostik", email: "rostik@mail.ru", :alias => "Katya", password:"12345678")
  User.create(name: "Elena", email: "olena@mail.ru", :alias => "Sadomaza", password:"12345678")
  User.create(name: "max", email: "max@mail.ru", :alias => "difortuna", password:"12345678")
  User.create(name: "Sofia", email: "sonia@mail.ru", :alias => "Sonka", password:"12345678")
  User.create(name: "Petro", email: "petro@mail.ru", :alias => "pit", password:"12345678")
  User.create(name: "Vasia", email: "vas@mail.ru", :alias => "inkvizitor", password:"12345678")
  User.create(name: "Vitalya", email: "vit@mail.ru", :alias => "alius", password:"12345678")
  User.create(name: "denis", email: "den@mail.ru", :alias => "den", password:"12345678")
  User.create(name: "orest", email: "orest@mail.ru", :alias => "kalyan", password:"12345678")
  User.create(name: "mateo", email: "mateo@mail.ru", :alias => "mateo", password:"12345678")
  User.create(name: "Vova", email: "vova@mail.ru", :alias => "kapilla", password:"12345678")
end