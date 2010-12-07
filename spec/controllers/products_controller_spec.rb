require 'spec_helper'

describe ProductsController do
  it { {:get    => 'products'}.should route_to(:controller => 'products', :action => 'index') }
  it { {:get    => 'products/1'}.should route_to(:controller => 'products', :action => 'show', :id => "1") }
  it { {:get    => 'products/tags/1'}.should route_to(:controller => 'products', :action => 'tags', :tag => "1") }

  context "on GET to #index" do
    it "should assign the products variable" do
      Factory(:product)
      get :index
      assigns(:products).should == Product.visible
    end
  end

  context "on GET to #show" do
    it "should assign the product to the one referenced by its id" do
      product = Factory(:product, :visible => true)
      get :show, :id => product.id
      assigns(:product).should == product
    end
    it "should store in a cookie the visited products" do
      Product.destroy_all
      p1 = Factory(:product, :visible => true)
      p2 = Factory(:product, :visible => true)
      p3 = Factory(:product, :visible => true)
      get :show, :id => p1.id
      get :show, :id => p2.id
      get :show, :id => p3.id
      response.cookies['user_visited_products'].split(",").should == Product.all.map(&:id).map(&:to_s)
    end
  end
  
  context "on GET to #tags" do
    it "should set the products variable with the products that have the received tag" do
      Product.destroy_all
      p1 = Factory(:product, :visible => true)
      p1.tag_list = "tag1"
      p1.save
      p2 = Factory(:product, :visible => true)
      p3 = Factory(:product, :visible => true)
      p3.tag_list = "tag1, tag2"
      p3.save
      
      get :tags, :tag => "tag1"
      # assigns(:products).should == [p1, p2]
      # get :tags, :tag => "tag2"
      # assigns(:products).should == [p2]
    end
  end
end
