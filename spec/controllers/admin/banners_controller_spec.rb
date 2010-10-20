require 'spec_helper'

describe Admin::BannersController do
  it { {:get    => 'admin/banners'}.should route_to(:controller => 'admin/banners', :action => 'index') }
  it { {:get    => 'admin/banners/1/edit'}.should route_to(:controller => 'admin/banners', :action => 'edit', :id => "1") }
  it { {:get    => 'admin/banners/1'}.should route_to(:controller => 'admin/banners', :action => 'show', :id => "1") }
  it { {:put    => 'admin/banners/1'}.should route_to(:controller => 'admin/banners', :action => 'update', :id => "1") }
  it { {:delete => 'admin/banners/1'}.should route_to(:controller => 'admin/banners', :action => 'destroy', :id => "1") }
  it { {:post   => 'admin/banners'}.should route_to(:controller => 'admin/banners', :action => 'create') }
  it { {:get    => 'admin/banners/new'}.should route_to(:controller => 'admin/banners', :action => 'new') }
  
  context "on GET to #index" do
    before(:each) do
      login
    end
    it "should assign the banners variable" do
      Factory(:banner)
      get :index
      assigns(:banners).should == Banner.all
    end
  end
  
  context "on POST to #create" do
    before(:each) do
      login
    end
    it "should create a banner if valid params are passed" do
      Banner.destroy_all
      lambda do
        post :create, :banner => Factory.attributes_for(:banner)
      end.should change(Banner, :count).by(1)
      response.should redirect_to(new_admin_banner_url)
    end
    it "should not create a banner if incorrect params are passed" do
      lambda do
        post :create, :banner => Factory.attributes_for(:banner, :name => "")
      end.should_not change(Banner, :count)
      response.should_not redirect_to(new_admin_banner_url)
      response.should render_template('new')
    end
  end
  
  context "on GET to #show" do
    before(:each) do
      login
    end
    it "should assign the banner to the one referenced by its id" do
      banner = Factory(:banner)
      get :show, :id => banner.id
      assigns(:banner).should == banner
    end
  end
  
  context "on GET to #edit" do
    before(:each) do
      login
    end
    it "should assign the banner to the one referenced by its id" do
      banner = Factory(:banner)
      get :edit, :id => banner.id
      assigns(:banner).should == banner
    end
  end
  
  context "on PUT to #update" do
    before(:each) do
      login
    end
    it "should update a banner if valid params are passed" do
      banner = Factory(:banner)
      put :update, :id => banner.id, :banner => {:name => 'updated name'}
      banner.reload
      banner.name.should == 'updated name'
      response.should redirect_to(admin_banners_url)
    end
    it "should not update a banner if incorrect params are passed" do
      banner = Factory(:banner, :name => 'original name')
      put :update, :id => banner.id, :banner => {:name => ''}
      banner.reload
      banner.name.should_not == 'updated name'
      response.should_not redirect_to(admin_banners_url)
      response.should render_template('edit')
    end
  end
  
  context "on DELTE to #destroy" do
    before(:each) do
      login
    end
    it "should delete the referenced banner" do
      banner = Factory(:banner)
      lambda do
        delete :destroy, :id => banner.id
      end.should change(Banner, :count).by(-1)
    end
  end
  
  def login
    @user = Factory(:user)
    login_a_user(@user)
  end
  
end
