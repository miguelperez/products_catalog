Given /^the following (.*) exists:$/ do |model, table|
  case model
    when /categories/i
      sym = :category
    when /products/i
      sym = :product
  end
  table.hashes.each do |hash|
      Factory(sym, hash)  
  end
end