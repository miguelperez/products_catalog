require 'spec_helper'

describe Admin::UsersController do

  it { {:get => "admin/users/1/edit"}.should route_to(:controller => "admin/users", :action => "edit", :id => "1") }
  it { {:get => "admin/users/1"}.should route_to(:controller => "admin/users", :action => "show", :id => "1") }
  it { {:put => "admin/users/1"}.should route_to(:controller => "admin/users", :action => "update", :id => "1") }
  
  context "on GET to #edit" do
    before(:each) do
      @user = Factory(:user)
      login_a_user(@user)
    end
    it "should set the user variable" do
      get :edit, :id => @user.id
      assigns(:user).should == @user
    end
  end
  
  context "on GET to show" do
    before(:each) do
      @user = Factory(:user)
      login_a_user(@user)
    end
    it "should set the user variable" do
      user = Factory(:user)
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
  end
  
  context "on PUT to #update" do
    before(:each) do
      login_a_user
    end
    it "should not update the user information" do
      user = Factory(:user)
      put :update, :id => user.id, :user => {:password => "pas", :password_confirmation => "pass"}
      response.should render_template("edit")
    end
    it "should update the user information" do
      user = Factory(:user)
      put :update, :id => user.id, :user => {:password => "password", :password_confirmation => "password"}
      response.should redirect_to(root_url)
    end
  end
  def login_a_user(user = nil)
    activate_authlogic
    UserSession.create(user || Factory.build(:user))
  end
end
