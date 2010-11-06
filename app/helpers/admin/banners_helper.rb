module Admin::BannersHelper
  #returns a proc to be called in the shared table partial.
  def thumb_proc
    Proc.new { |object| image_tag(object.graphic.url(:thumb)) }
  end
  
  #returns a link that toggles the visibility of a banner.
  #it just sents a request to the update banner action with the attribute of visibility toggled
  def banner_visible_link
    Proc.new do |object|
      link_to(object.visible.to_s, admin_banner_path(object, :banner => {:visible => !!!object.visible}),:method => :put)
    end
  end
end
