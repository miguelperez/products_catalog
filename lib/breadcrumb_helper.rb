# This file holds the helper functions for making up the breadcrumbs.
module BreadcrumbHelper
  # Returns the breadcrumb depending on the controller we are in.
  def breadcrumb(controller)
    products = t("navigation.products")
    case controller.controller_name
    when /products/
      product = controller.instance_variable_get(:@product)
      tail = product.nil? ? "" : "/ #{fetch_product_crumb(product)}"
      pre_tail = tail.blank? ? products : link_to(products, products_path)
    when /categories/
      category = controller.instance_variable_get(:@category)
      tail = category.nil? ? "" : "/ #{fetch_categories_crumb(category, false)}"
      pre_tail = tail.blank? ? products : link_to(products, products_path)
    when /contact/
      pre_tail = t("titles.contact")
    end
    return "#{link_to(t("navigation.home"), root_path)} / #{pre_tail} #{tail}"
  end
  
  private
  
  # given a product, it will fetch the category and its parents.
  def fetch_product_crumb(product)
    return "" unless product
    "#{fetch_categories_crumb(product.category)} / #{[product.name]}"
  end
  
  # Given a category it will fetch the crumbs up in the tree (parent categories of the passed category)
  def fetch_categories_crumb(category, link_last_one = true)
    return "" unless category
    ancestors = category.ancestors
    last = link_last_one ? "#{link_to(category.name, category_path(category))}" : "#{category.name}"
    return last if ancestors.empty?
    links = ancestors.inject("") do |acc, elem|
      acc += "#{link_to(elem.name, category_path(elem))} /"
    end + last
  end
end