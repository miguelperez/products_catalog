Given /^the following categories exists:$/ do |table|
  table.hashes.each do |hash|  
      Factory(:category, hash)  
  end
end