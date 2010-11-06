module Admin::ProductsHelper
  #returns a link that toggles the visibility of a product.
  #it just sents a request to the update product action with the attribute of visibility toggled
  def product_visible_link
    Proc.new do |object|
      link_to(object.visible.to_s, admin_product_path(object, :product => {:visible => !!!object.visible}),:method => :put)
    end
  end
end
