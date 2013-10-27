And /there is only one user with the email "(.*)" in the database/ do |email|
  User.where(:email => email).length == 1
end

And /there is the user with email "(.*)" in the database/ do |email|
	User.create!(:email => email, :password => 'password123')
end
