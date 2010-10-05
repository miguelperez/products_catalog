require 'spec_helper'

describe Admin::CategoriesController do
  it { {:get    => 'admin/categories'}.should route_to(:controller => 'admin/categories', :action => 'index') }
  it { {:get    => 'admin/categories/1/edit'}.should route_to(:controller => 'admin/categories', :action => 'edit', :id => "1") }
  it { {:put    => 'admin/categories/1'}.should route_to(:controller => 'admin/categories', :action => 'update', :id => "1") }
  it { {:delete => 'admin/categories/1'}.should route_to(:controller => 'admin/categories', :action => 'destroy', :id => "1") }
  it { {:post   => 'admin/categories'}.should route_to(:controller => 'admin/categories', :action => 'create') }
  it { {:get    => 'admin/categories/new'}.should route_to(:controller => 'admin/categories', :action => 'new') }

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit', :id => '1'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should be successful" do
      get 'update', :id => '1'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy', :id => '1'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end
end
