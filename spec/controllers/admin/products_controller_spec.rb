require 'spec_helper'

describe Admin::ProductsController do
  it { {:get    => 'admin/products'}.should route_to(:controller => 'admin/products', :action => 'index') }
  it { {:get    => 'admin/products/1/edit'}.should route_to(:controller => 'admin/products', :action => 'edit', :id => "1") }
  it { {:get    => 'admin/products/1'}.should route_to(:controller => 'admin/products', :action => 'show', :id => "1") }
  it { {:put    => 'admin/products/1'}.should route_to(:controller => 'admin/products', :action => 'update', :id => "1") }
  it { {:delete => 'admin/products/1'}.should route_to(:controller => 'admin/products', :action => 'destroy', :id => "1") }
  it { {:post   => 'admin/products'}.should route_to(:controller => 'admin/products', :action => 'create') }
  it { {:get    => 'admin/products/new'}.should route_to(:controller => 'admin/products', :action => 'new') }
  
  context "on GET to #index" do
    before(:each) do
      login
    end
    it "should assign the products variable" do
      Factory(:product)
      get :index
      assigns(:products).should == Product.all
    end
  end
  
  context "on GET to #new" do
    before(:each) do
      login
    end
    it "should assign the products variable" do
      get :new
      assigns(:product).should_not be_nil
      assigns(:categories).should == Category.all
    end
  end
  
  context "on POST to #create" do
    before(:each) do
      login
    end
    it "should create a product if valid params are passed" do
      Product.destroy_all
      lambda do
        post :create, :product => Factory.attributes_for(:product)
      end.should change(Product, :count).by(1)
      response.should redirect_to(new_admin_product_url)
    end
    it "should not create a product if incorrect params are passed" do
      lambda do
        post :create, :product => Factory.attributes_for(:product, :name => "")
      end.should_not change(Product, :count)
      response.should_not redirect_to(new_admin_product_url)
      response.should render_template('new')
    end
  end
  
  context "on GET to #show" do
    before(:each) do
      login
    end
    it "should assign the product to the one referenced by its id" do
      product = Factory(:product)
      get :show, :id => product.id
      assigns(:product).should == product
    end
  end
  
  context "on GET to #edit" do
    before(:each) do
      login
    end
    it "should assign the product to the one referenced by its id" do
      product = Factory(:product)
      get :edit, :id => product.id
      assigns(:product).should == product
      assigns(:categories).should == Category.all
    end
  end
  
  context "on PUT to #update" do
    before(:each) do
      login
    end
    it "should update a product if valid params are passed" do
      product = Factory(:product)
      put :update, :id => product.id, :product => {:name => 'updated name'}
      product.reload
      product.name.should == 'updated name'
      response.should redirect_to(admin_products_url)
    end
    it "should not update a product if incorrect params are passed" do
      product = Factory(:product, :name => 'original name')
      put :update, :id => product.id, :product => {:name => ''}
      product.reload
      product.name.should_not == ''
      response.should_not redirect_to(admin_products_url)
      response.should render_template('edit')
    end
    it "should not update the visible attribute if the product do not fullfill the requirements" do
      product = Factory(:product, :name => 'original name', :price => '', :visible => false)
      put :update, :id => product.id, :product => {:visible => true}
      product.reload
      product.visible.should_not == true
    end
    it "should update the visible attribute if the product fullfills the requirements" do
      product = Factory(:product, :name => 'original name', :price => '12', :visible => false)
      # stubbing out the images array so it can pass the validations
      product.stub!(:images).and_return([1])
      Product.stub!(:find).and_return(product)
      put :update, :id => product.id, :product => {:visible => true}
      product.reload
      product.visible.should == true
    end
  end
  
  context "on DELTE to #destroy" do
    before(:each) do
      login
    end
    it "should delete the referenced product" do
      product = Factory(:product)
      lambda do
        delete :destroy, :id => product.id
      end.should change(Product, :count).by(-1)
    end
  end
  
  def login
    @user = Factory(:user)
    login_a_user(@user)
  end

end
