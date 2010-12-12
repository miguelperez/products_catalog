# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include ArrayExtentions
  #returns a normal link that will be styled as a button
  def link(title, path, span_class = '')
    title = t(title)
    "<a href='#{path}' title='#{title}' class='link'><span class='#{span_class}'>#{title}</span></a>"
  end
  
  #truncates the received attribute if it can be truncated. Otherwise it will return the received object
  def truncate_result(attribute, length = 20)
    return "-" if attribute.nil? || attribute.blank?
    attribute = "#{attribute}"
    begin
      h truncate(attribute, :length => length)
    rescue Exception => e
      h attribute
    end
  end
  
  #returns the label for a submit button
  def submit_label(object)
    object.new_record? ? t('forms.create') : t('forms.update')
  end
  
  #This is for being able to know wich controller is selected, and thus put the selected property in the navigation 
  #link
  def selected_controller?(name)
    return "selected" if request.params[:controller].eql?(name)
    ""
  end
  
  #Returns the breadcrumb depending on the controller we are in.
  def breadcrumb(controller)
    case controller.controller_name
    when /products/
      product = controller.instance_variable_get(:@product)
      tail = product.nil? ? "" : "/ #{fetch_product_crumb(product)}"
      pre_tail = tail.blank? ? "Products" : link_to("Products", products_path)
    when /categories/
      category = controller.instance_variable_get(:@category)
      tail = category.nil? ? "" : "/ #{fetch_categories_crumb(category, false)}"
      pre_tail = tail.blank? ? "Products" : link_to("Products", products_path)
    end
    return "#{link_to("Home", root_path)} / #{pre_tail} #{tail}"
  end
  
  private
  
  #given a product, it will fetch the category and its parents.
  def fetch_product_crumb(product)
    return "" unless product
    "#{fetch_categories_crumb(product.category)} / #{[product.name]}"
  end
  
  #Given a category it will fetch the crumbs up in the tree (parent categories of the passed category)
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
