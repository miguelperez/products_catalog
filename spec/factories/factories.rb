Factory.sequence :email do |n|
  "email#{n}@email.com"
end

Factory.sequence :title do |n|
  "name_#{n}"
end

Factory.define :user do |f|
  f.email    { Factory.next(:email) }
  f.password { "some-password" }
  f.password_confirmation { "some-password" }
end

Factory.define :category do |f|
  f.name    { Factory.next(:name) }
end