require 'spec_helper'

describe Admin::CategoriesController do
  it { {:get    => 'admin/categories'}.should route_to(:controller => 'admin/categories', :action => 'index') }
  it { {:get    => 'admin/categories/1/edit'}.should route_to(:controller => 'admin/categories', :action => 'edit', :id => "1") }
  it { {:put    => 'admin/categories/1'}.should route_to(:controller => 'admin/categories', :action => 'update', :id => "1") }
  it { {:delete => 'admin/categories/1'}.should route_to(:controller => 'admin/categories', :action => 'destroy', :id => "1") }
  it { {:post   => 'admin/categories'}.should route_to(:controller => 'admin/categories', :action => 'create') }
  it { {:get    => 'admin/categories/new'}.should route_to(:controller => 'admin/categories', :action => 'new') }

  context "on GET to #index" do
    before(:each) do
      login
    end
    it "should assign the categories variable" do
      Factory(:category)
      get :index
      assigns(:categories).should == Category.all
    end
  end
  
  context "on GET to #new" do
    before(:each) do
      login
    end
    it "should assign the categories variable" do
      get :new
      assigns(:category).should_not be_nil
      assigns(:categories).should == Category.all
    end
  end
  
  context "on POST to #create" do
    before(:each) do
      login
    end
    it "should create a category if valid params are passed" do
      Category.destroy_all
      lambda do
        post :create, :category => Factory.attributes_for(:category)
      end.should change(Category, :count).by(1)
      response.should redirect_to(new_admin_category_url)
    end
    it "should not create a category if incorrect params are passed" do
      lambda do
        post :create, :category => Factory.attributes_for(:category, :name => "")
      end.should_not change(Category, :count)
      response.should_not redirect_to(new_admin_category_url)
      response.should render_template('new')
    end
  end
  
  context "on GET to #edit" do
    before(:each) do
      login
    end
    it "should assign the category to the one referenced by its id" do
      category = Factory(:category)
      get :edit, :id => category.id
      assigns(:category).should == category
      assigns(:categories).should == Category.all
    end
  end
  
  context "on PUT to #update" do
    before(:each) do
      login
    end
    it "should update a category if valid params are passed" do
      category = Factory(:category)
      put :update, :id => category.id, :category => {:name => 'updated name'}
      category.reload
      category.name.should == 'updated name'
      response.should redirect_to(admin_categories_url)
    end
    it "should not update a category if incorrect params are passed" do
      category = Factory(:category, :name => 'original name')
      put :update, :id => category.id, :category => {:name => ''}
      category.reload
      category.name.should_not == 'updated name'
      response.should_not redirect_to(admin_categories_url)
      response.should render_template('edit')
    end
  end
  
  context "on DELTE to #destroy" do
    before(:each) do
      login
    end
    it "should delete the referenced category" do
      category = Factory(:category)
      lambda do
        delete :destroy, :id => category.id
      end.should change(Category, :count).by(-1)
    end
  end
  
  def login
    @user = Factory(:user)
    login_a_user(@user)
  end
end
