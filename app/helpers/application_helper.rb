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
  
  def selected_controller?(name)
    return "selected" if request.params[:controller].eql?(name)
    ""
  end
end
