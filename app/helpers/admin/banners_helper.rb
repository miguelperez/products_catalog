module Admin::BannersHelper
  #returns a proc to be called in the shared table partial.
  def thumb_proc
    Proc.new { |object| image_tag(object.graphic.url(:thumb)) }
  end
end
