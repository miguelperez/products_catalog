Factory.sequence :email do |n|
  "email#{n}@email.com"
end

Factory.sequence :name do |n|
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

Factory.define :product do |f|
  f.name        { Factory.next(:name) }
  f.description { "Description of the product" }
  f.category    { Factory(:category) }
end

Factory.define :banner do |f|
  f.name         { Factory.next(:name) }
  f.description  { "Description of the banner" }
  f.graphic_file_name    { "name" }
end

Factory.define :subscriber do |f|
  f.email    { Factory.next(:email) }
  f.name     { Factory.next(:name) }
end