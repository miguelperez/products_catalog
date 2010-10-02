Given /^(?:|I )am not logged in$/ do 
  visit path_to('logout page')
end

Given /^I am a registered user with email "(.+)"$/ do |email|
  params = {
    "email"=> email,
    "password"=>"password",
    "password_confirmation"=>"password"
  }
  @user = Factory(:user, params)
end

When /^I login with valid credentials$/ do
  visit path_to('login page')
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => "password")
  click_button("Login")
end