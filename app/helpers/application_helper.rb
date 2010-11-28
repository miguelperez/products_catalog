# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #returns a normal link that will be styled as a button
  def link(title, path, span_class = '')
    "<a href='#{path}' class='link'><span class='#{span_class}'>#{title}</span></a>"
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
      tail = product.nil? ? "" : "/ #{product.name}"
      return "#{link_to("Home", root_path)} / #{link_to("Products", products_path)} #{tail}"
    when /categories/
      category = controller.instance_variable_get(:@category)
      tail = category.nil? ? "" : "/ #{category.name}"
      return "#{link_to("Home", root_path)} / #{link_to("Products", products_path)} #{tail}"
    end
  end
end
