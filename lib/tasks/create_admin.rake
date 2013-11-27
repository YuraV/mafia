task :create_admin => :environment do
  if User.exists?(name: "admin", email: "admin@mafia.com", :alias => "manager")
    false
  else
    admin = User.new(name: "admin", email: "admin@mafia.com", :alias => "manager", password:"mafiaadmin")
    admin.add_role "admin"
    admin.save(validate: false)
  end
end
