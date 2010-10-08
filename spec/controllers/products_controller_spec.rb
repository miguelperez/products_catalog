require 'spec_helper'

describe ProductsController do
  it { {:get    => 'admin/products'}.should route_to(:controller => 'admin/products', :action => 'index') }
  it { {:get    => 'admin/products/1'}.should route_to(:controller => 'admin/products', :action => 'show', :id => "1") }

  context "on GET to #index" do
    it "should assign the products variable" do
      Factory(:product)
      get :index
      assigns(:products).should == Product.all
    end
  end

  context "on GET to #show" do
    it "should assign the product to the one referenced by its id" do
      product = Factory(:product)
      get :show, :id => product.id
      assigns(:product).should == product
    end
  end
end
