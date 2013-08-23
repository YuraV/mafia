task :add_users => :environment do
  User.all.each do |user|
    
      User.create(name:'yura', password:12345678,alias:'Yura',email:'yura@mail.mail')
      User.create(name:'red', password:12345678,alias:'Rudi',email:'rudi@mail.mail')
      User.create(name:'Sofia', password:12345678,alias:'Sonka',email:'sonia@mail.mail')
      User.create(name:'Scarlet', password:12345678,alias:'Scarlet',email:'scarlet@mail.mail')
      User.create(name:'Taras', password:12345678,alias:'Don',email:'don@mail.mail')
      User.create(name:'Vitalik', password:12345678,alias:'alius',email:'alius@mail.mail')
      User.create(name:'Rostik', password:12345678,alias:'Katia',email:'katya@mail.mail')
      User.create(name:'vasia', password:12345678,alias:'inkvizitor',email:'yura@mail.mail')
      User.create(name:'Alka', password:12345678,alias:'Lili',email:'lilu@mail.mail')
      User.create(name:'Denis', password:12345678,alias:'Den',email:'Den@mail.mail')

  end  
end