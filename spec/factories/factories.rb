Factory.sequence :email do |n|
  "email#{n}@email.com"
end

Factory.define :user do |f|
  f.email    { Factory.next(:email) }
  f.password { "some-password" }
  f.password_confirmation { "some-password" }
end