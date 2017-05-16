# Create First User (Admin)

user = User.new(:fullname => 'Administrator', :email => 'admin@localhost', :password => 'safbd', :password_confirmation => 'safbd', :admin => 't').save(validate: false)
