# this module define some extensions for the Array Class.
module ArrayExtentionsHelper
  #returns an HtmlUlElement from and array
  def to_ul(array, ul_options = {})
    li = array.inject("") { |acc, elem|
      acc += "<li>#{elem.to_s}</li>"
      acc
    }
    "<ul#{parse_options(ul_options)}>#{li}</ul>"
  end

  #given an Array that have strings, it will return an array containing links that pass the strings as a 
  #parameter to the url
  def convert_to_links(array, route_name)
    raise "route_name must be a symbol route name." unless route_name.is_a?(Symbol)
    array.map{|object| link_to(object.to_s.capitalize, send(route_name, object))}
  end

  private
  #Given a hash of options it will return an HTML attributes representation of it
  def parse_options(options_array = {})
    options_array.inject(""){|acc, elem| acc += " #{elem[0].to_s}='#{elem[1]}'"}
  end
end