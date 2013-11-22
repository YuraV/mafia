task :create_admin => :environment do
  admin = User.new(name: "admin", email: "admin@mafia.com", :alias => "manager", password:"mafiaadmin")
  admin.add_role "admin"
  admin.save(validate: false)
end
