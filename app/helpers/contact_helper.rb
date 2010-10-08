module ContactHelper
  def field_for(form, name, hash_options)
    case hash_options['field'] 
    when /text_field/i 
      return form.text_field(name)
    when /text_area/i
      return form.text_area(name)
    when /select/i
      return form.select(name, hash_options['values'], {:prompt => 'Select an option'})
    end 
  end
end
