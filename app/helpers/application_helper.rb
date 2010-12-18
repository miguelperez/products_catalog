# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include ArrayExtentionsHelper
  include NiceTableHelper
  include BreadcrumbHelper
  
  # returns the will paginate links. This is done as a function in a helper so we can customize it in one place, instead of
  # having to write all the options in a lot of views.
  def will_paginate_links(objects)
    will_paginate objects, :next_label => t("navigation.next"), :previous_label => t("navigation.previous")
  end
  
  # returns a normal link that will be styled as a button
  def link(title, path, span_class = '')
    title = t(title)
    "<a href='#{path}' title='#{title}' class='link'><span class='#{span_class}'>#{title}</span></a>"
  end
  
  # returns a link to the application dashboard
  def link_to_dashboard
    link("forms.back", admin_path)
  end
  
  # truncates the received attribute if it can be truncated. Otherwise it will return the received object
  def truncate_result(attribute, length = 20)
    return "-" if attribute.nil? || attribute.blank?
    attribute = "#{attribute}"
    begin
      h truncate(attribute, :length => length)
    rescue Exception => e
      h attribute
    end
  end
  
  # returns the label for a submit button
  def submit_label(object)
    object.new_record? ? t('forms.create') : t('forms.update')
  end
  
  # This is for being able to know wich controller is selected, and thus put the selected property in the navigation 
  # link
  def selected_controller?(name)
    return "selected" if request.params[:controller].eql?(name)
    ""
  end
end
