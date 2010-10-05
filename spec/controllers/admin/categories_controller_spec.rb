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
      @user = Factory(:user)
      login_a_user(@user)
    end
    it "should assign the categories variable" do
      Factory(:category)
      get :index
      assigns(:categories).should == Category.all
    end
  end
  
end
