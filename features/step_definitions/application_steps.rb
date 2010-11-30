Then /I should see that product category names?/ do
  unless @product.category.ancestors.empty?
    Then("I should see \"#{@product.category.name}\"")
  else
    @product.category.ancestors.each do |category|
      Then("I should see \"#{category.name}\"")
    end
  end
end