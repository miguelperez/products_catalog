Given /^a product exists$/ do
  @product = Factory(:product, :visible => true, :price => 1)
  @category = @product.category
end

Given /^that product category has (\d*) ancestors?$/ do |number|
  number.to_i.times do |n|
    @category.parent = Factory(:category)
    @category.save
    @category = @category.parent
  end
end

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