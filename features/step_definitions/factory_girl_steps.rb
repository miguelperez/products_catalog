Given /^the following (.*) exists:$/ do |model, table|
  case model
    when /categories/i
      sym = :category
    when /products/i
      sym = :product
    when /banners/i
      sym = :banner
    when /subscribers/i
      sym = :subscriber
  end
  table.hashes.each do |hash|
      Factory(sym, hash)  
  end
end

Given /^there are (\d+) (.*) created$/ do |number, model|
  case model
    when /categories/i
      sym = :category
    when /products/i
      sym = :product
    when /banners/i
      sym = :banner
  end
  number.to_i.times do
      Factory(sym)  
  end
end