# This module helps in the creation of a Html table element, with the contents of and array.
# It is highly personalizable and translatable.
module NiceTable
  
  # Returns all the heades for this table
  def table_header(array_of_attributes, class_name)
    object = Object::const_get(class_name)
    render(:partial => 'shared/table_header', :collection => translate_attribute_names(array_of_attributes, object))
  end
  
  private
  # returns the translated name of attributes.
  # Receives the attribute names and the object in which we will look for the translation
  def translate_attribute_names(attributes, object)
    attributes.map do |name|
      name.downcase!
      if(name.eql?("actions"))
        t("titles.actions")
      else
        object.human_attribute_name(name.parameterize("_"))
      end
    end
    
  end
  
end