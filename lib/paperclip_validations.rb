module PaperclipValidations
  #this method is called when this module is included in any other class or module.
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.send(:extend, ClassMethods)
    base.send(:before_create, :randomize_file_name)
  end
  
  #Methods accessible through (ClassName.new()).method
  module InstanceMethods
    private
    #We don't want users to be able to see the image file name
    def randomize_file_name
      return unless graphic_file_name
      extension = File.extname(graphic_file_name).downcase
      self.graphic.instance_write(:file_name, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
    end
  end
  
  #Methods accessible through ClassName.method
  module ClassMethods 
  end
end