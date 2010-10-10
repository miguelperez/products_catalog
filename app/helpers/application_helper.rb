# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #returns a normal link that will be styled as a button
  def link(title, path, span_class = '')
    "<a href='#{path}' class='link'><span class='#{span_class}'>#{title}</span></a>"
  end
end
